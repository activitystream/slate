---
title: Event Message Reference

language_tabs:
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>

includes:
  - aspects
  - sending
  - recipes
  - advanced
  - message_definitions

search: true
---

# Introduction
This documentation will help you send events to Activity Stream from any data source using REST API or a Message Queue. It will explain the basics and get you going quickly but will also provide you with all the details to take full advantage of the Activity Stream platform.

## Main concepts
Please familiarize yourself with the following before you start constructing your event-messages.

### Event
An event is any event/action reported to Activity Stream from an external systems via an event-message. Each event becomes and item in the activity stream and is associated with all the entities involved in the event.

<!--
place during daily operations which has relevance for the organization or its customers. A website login, complete purchase, new order or client expressing an interest in a product are all examples of such events.

Typically these events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.

Each event is reported by a single or more event-messages which can be sent directly to to the REST API or to Activity Stream via messaging queue.
-->
### Entity
Business-entities are automatically created when referenced by an event. The event, as well as all future events, are then linked to that entity. Each event becomes a part of the entities history, its activity stream, that reflects the action reported by the event and the role that the entity played in the event. [Entity-types]() as created just-in-time and can be [sub-classed]() for advanced querying

### Event-Entity Graph
Activity Stream's stores all events in a [graph](). This enables a range of valuable services but it does introduce some requirements on the event-message structure.

### Role
The entities involved in an event all have respective roles. The "ACTOR" is, for example, the entity triggering the event and "AFFECTS" is an entity directly affected by the event while "REFERENCES" is the role used for entities involved in the event but have no real bearing on the event. Common roles are built into Activity Stream but new [Roles can defined on the fly]().
### Link Type
In Activity Stream any entity can be [linked to any other entity]() and the link between the entities can be typed and have properties. That way a Customer can, for example, be a "OWNER" of a Car. Common Link types are built into Activity Stream but new [Link-Types can defined on the fly]().
### Message Aspects
[Aspects]() are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation.
### Time-Series
Activity Stream includes a real-time analytics store that is capable of storing data points with multiple dimensions which are available for querying as soon as submitted.
Think of the AS time series as a OLAP/Cube which is updated continuously and can be sliced and diced at will.


<!--
Activity Stream’s main goal is to collect data in real time from a number of different data sources to assemble a complete view of what is happening, who is responsible and what effects it’s having. This “big-picture” is used to gain a unique view of events happening across the enterprise, a view which is normally unattainable as data is scattered across numerous systems.

Continuous, cognitive, analysis of this data is performed to detect perishable insights, opportunities and threats so Activity Stream can provide actionable intelligence and observations which are are presented to the right people, or systems, at the right time and in the right context to turn data into information, knowledge and appropriate actions.

For a developer it may help to think of Activity Stream as a centralized system-log that, instead of storing system-related-information, stores business-related-information. This "biz-log", formally known as the AS Historical Store, supports both arbitrary events and times-eries data. It also has the ability to link events and time-series data to the associated business entities and link business entities to each other.
-->

<!-- It can, for example, be viewed from the perspective of the client, the product, a division/department, a particular event type or any combination there of. It can be used to keep people informed or used for analytical processing that can detect and discover patterns, opportunities, threats and make other observations we call Actionable Intelligence that is produced to reflect on daily operations and draw attention to improvement opportunities. -->
# Event Messages
## Message Properties
```javascript
//A sample message reporting a page-view
{
  "action": "as.web.page.browse",
  "source": "com.activitystream.www",
  "occurred_at": "2014-11-10T12:01:02.345Z",
  "entities": [
    {"ACTOR":"Session/KJ982KJ2", "proxy_for":"Customer/311068"},
  ],
  "aspects": {
    "pageview": {
      "path":"/cat/prod-cat/product",
      "referrer":"http://www.somesite.com/page/ad"
    }
    "client_device": {
      "user_agent":"Mozilla/5.0 ..."
    }
    "client_ip": {
      "ip":"190.236.141.125"
     }
  },
  "properties": {
    "use":4,
    "any":"json",
    "structure":true
  }
}
```
Property | Type | Description
-------- | ---- | -----------
**action** | String | The Action reported by the event | Message key
**source** | String | Where was the event sent from
**entities** | List\<Relation\> | All entities involved in the event.
occurred_at | DateTime | The exact time that the event occurred (ISO 8601 serialized)
aspects| Map\<Aspect,Value\>| Aspects contain additional event information that Activity Stream knows how to analyse and represent
properties | Map\<S,O\> | Any JSON structure containing additional event information in a custom format
importance | Integer | The event importance (priority/severity) setting ranging from 0 .. 5.
acl | List\<Rule\> | Access Control List (See [access control](#access-control))
token | String | Use a default message pre-registered with a token. (See [token based defaults](#message-defaults-using-token))

[Message-Property details]()


<!--
Property | Type | Description
-------- | ---- | -----------
**action** | String | Identifies the action reported by the event</br></br>**Example:** as.web.page.browse (*domain.category.subcat.action*)<br><ul><li>Dot separated hierarchy</li><li>Ranges from the least specific to the most specific</li><li>Specified in lower case</li></ul>When constructing your own actions it can help to think of these as a hierarchical category structure where the last part as a verb.
**source** | String | Identifies where the event is originated from.</br></br>**Example:** com.activitystream.webserver1 *(tld.domain.host)*</br><ul><li>A dot separated list representing a source hierarchy.</li><li>Ranges from the least_specific.to_the.most_specific</li><li>Specified in lower case</li></ul>
**entities** | List\<Relation\> | Lists all entities somehow involved in the event.<br><br>Every involved entity is listed with the role (relations-type) it had in the event. All events have at least an ACTOR.</br></br>Please view this detailed list of built-in [roles (relation-types)](#roles-amp-relations).
occurred_at | DateTime | The exact time that the event occurred</br><ul><li>ISO 8601 serialized datetime</li><li>Includes milliseconds\* and time zone</li><li>Set by the source system.</li></ul>\**Milliseconds are important to create a unique event signature (UUID)*. (Defaults to AS server time on reception)
aspects| Map\<Aspect,Value\>| Aspects are commonly used information snippets which have rich support in Activity Stream for processing, analysis and representation.</br></br>Please view this [detailed list of aspects](#message-aspects).
properties | Map\<S,O\> | Any JSON structure can be used to store custom properties not stored as aspects.
-->

## Advanced Properties
```javascript

{
  "action": "as.web.page.browse",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {"ACTOR":"User/stefanb"}
  ],
  "aspects": {
    "pageview": {
      "path":"/something/classified"
    },
  },
  "importance": 5,
  "acl": [{"READ":"User/stefanb"}]
}
```

<--
Property | Type | Description
-------- | ---- | -----------
importance | Integer | A message importance (priority/severity) setting ranging from 0 .. 5. <ul><li>5 critical</li><li>4 very important</li><li>3 important</li><li>2 notable</li><li>1 unimportant</li><li>0 auditing only event</li></ul>Importance is used for filtering visible events in the activity stream and for emphasising important events. Importance can be set globally for the action or for individual events.
acl | List\<Rule\> | Access Control List (See [access control](#access-control))
token | String | If defaults have been provided for the token then the new message is merged with those defaults before its processed. (See [token based defaults](#message-defaults-using-token))
payload | Base64 | Additional details regarding the event.<br><br> **Please note**: The content of payload is compressed and stored using Base64 encoding. It’s returned in the same form as reported but it’s content can not, for this reason, be used in queries.
-->

## API
### REST
### Message QUEUE

# Entities
```javascript
//This event message:
{
  "action": "as.crm.auth.login",
  "source": "com.activitystream.www",
  "involves": [
    {"ACTOR": "Artist/984829"}
  ]
}

//would automatically create this entity:
{
  "entity_ref": "Artist/984829",
  "_stream_id": "131ec749-7efa-39f3-a1dc-023069c87c1f",
  "_registered_at": "2014-10-07T12:03:40.779Z",
}

//Example of a more complete entity
{
  "entity_ref": "Artist/984829",
  "aspects": {
    "presentation":{
      "label":"Jason Aldean",
      "details_url":"https://www.facebook.com/jason.aldean",
      "thumbnail":"http://media.ticketmaster.com/tm/en-us/dbimages/182004a.jpg"
    },
    "summary": {
      "title":"Jason Aldean the country singer/songwriter",
      "content":"Jason Aldine Williams (born February 28, 1977), known professionally as Jason Aldean, is an American country music singer. Since 2005, Jason Aldean has recorded for Broken Bow Records, a record label for which he has released six albums and sixteen singles. His 2010 album, My Kinda Party, is certified triple-platinum by the Recording Industry Association of America (RIAA), while his 2005 self-titled debut, 2007 album Relentless, 2009 album Wide Open, 2012 album Night Train are all certified single-platinum."
    },
    "classification": {
      "genre":"Country & Folk",
      "gender":"Male",
      "type":"Solo Artist"
    },
    "tags": ["hot","not"]
  }
  "properties": {
    "something":true,
    "anything":{"you":["might","want"]},
    "everything":"almost"
  }
}
```

In Activity Stream Business Entities represent any object or item that are references by events in the activity stream. An insurance company would typically, and at least, have customer, vehicle, policy and claim as business entities.
Entities are created automatically this first time they are referenced by an event but they can also be create explicitly using REST or by sending entity information in a dedicated message to the message queue.
###Additional entity information
Any JSON information can be stored for any business entity and when the AS-Aspects are used to store them then the Entity is represented properly in the AS user interface and meaningful information from the entity can be used while processing associated Business Events.
###Unlimited entity relations
Business entities are stored in a graph where even the most complicated relations between entities can be stored in a simple way. By using the same kind of approach as social sites use, to store different types of friendships and who is following who, we are able to link any entity with any other entity where the relationship types can be customized on the fly.
###Full referential integrity
Entities can not be deleted from the Entity Graph but access to them can be controlled using an Access Control List (see the ACL documentation for details).


Users, Customers, Orders, Employees, Invoices, Cases, Projects and Documents are all examples  of common (business) entities. Each entity produces or is affected by a considerable amount of events.

Each entity has its own even-log, its activity stream, showing all the events that are relevant for it where each event in the activity stream can also be a part of the activity streams of the other entities involved, like the employees, the customer or both.

It’s important to understand that all business-entities have both implicit and explicit links between them. 

An example of an implicit link is a order as it links the customer with the corresponding products, the employee handling the order with the customer and so forth. An account representative in charge of a customers account has an explicit relationship with the customer.

Capturing all of this in a graph is a valuable trade of Activity Stream. There it can be analyzed and mined in details greater than traditional systems can offer. 

-- //Each event is influenced by or influences some business-entities (a customer, order, task etc.) and these entities are referenced by these events. Activity Stream dynamically build a model of all entities so their event history can be analysed and presented. So the first time an entity is referenced by an event it is created and all subsequent events are attached to it. 

## Common Entity Properties
Property | Type | Description
-------- | ---- | -----------
entity_ref | String | <entity_type>/<entity_id>  Examples: Employee/stefanb a2def97d-f2b0-3dc8-be51-f2a54a1879c3 (Using Stream ID)
relations | List<Relation> | Entity Relations
aspects | Map | Supported aspects are: Classification, GeoLocation, Presentation, Tags, Locale, Timed, Summary, Attachments. Please see aspect documentation for further information.
properties | JSON | Any custom properties you might want to keep for the entity.

## Update Message
```javascript
{
  "event": "as.entity.update",
  "source": "as.provisioning.crud",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "involves": [
    {"ACTOR":"Employee/stefanb"},
    {"AFFECTS":"User/stefanb"}
  ],
  "aspects": {
    "patch": {
      "aspects":{
        "presentation":{
          "label":"Stefan Baxter"
        },
      }
    }
  }
}
```
Entity information can be updated by sending an update event which targets a single or multiple entities (Event Sourcing style).

This is an ideal way to keep track of changes as the change-event and the changes are reported in one integrated event and it ensures that all changes can be backtracked and the entity data viewed "from any point in time".

Changes are applied to all the entities lists with the "AFFECTS" role.

Field | Type | Description
----- | ---- | -----------
update | JSON | replaces the current aspects, properties with new values
patch | JSON | patches the current aspects, properties with altered values

**Remember:** The information stored with the entity is only meant to help with presentation, statistics, analysis and search and that it’s not an ideal place to be the source for business information*.

*Meaning that it should not become your primary storage*.
## Link
## API
### REST
### Message QUEUE

# Roles & Relations

# Collaboration
## Comments
```javascript
//Minimal comment message:
{
  "source":"com.activitystream.www",
  "involves": [
    {"COMMENTS":"Employee/stefan@flaumur.is"}, 
    {"COMMENTED_ON":"Vehicle/VF058"}
  ],
  "comment":"Some ride this is!" 
}

//Minimal comment using a stream_id to identify a event:
{
  "source":"com.activitystream.www",
  "involves": [
      {"COMMENTS":"Employee/lindarut"},
      {"COMMENTED_ON":"a2def97d-f2b0-3dc8-be51-f2a54a1879c3"}
  ],
  "comment":"This car is great, does it come in gold?" 
}

// Comment on a customer entity: 
{
  "source":"com.activitystream.www",
  "involves": [
    {"COMMENTS":"Employee/stefan@flaumur.is"},
    {"COMMENTED_ON":"Customer/3110686369"}
  ],
  "comment":"I’ll be back!" 
}

//Comment with tags and with explicit references to other employee: 
{
  "source":"com.activitystream.www",
  "involves": [
    {"COMMENTS":"Employee/stefanb"}, 
    {"MENTIONS":"Employee/sbaxter"}, 
    {"COMMENTED_ON":"Vehicle/VF058"}
  ],
  "aspects":{"tags":["smu","fleh"]},
  "comment":"This car is great, does it come in gold?" 
}

//Comment with tags and implicit/embedded reference to another employee: 
{
  "source":"com.activitystream.www",
  "involves": [
    {"COMMENTS":"Employee/stefanb"}, 
    {"COMMENTED_ON":"Vehicle/VF058"}
  ],
  "comment":"This car is great, does it come in gold @Employee/lindarut? #smu #fleh" 
}
```
A comment can be made regarding any event in Activity Stream as well as directly on business entities. A single comment can be attached to multiple targets and can contain detailed information and references to users etc.

Comments provide a way to facilitate business focused discussion on anything that has happened in a social kind of way. In addition to facilitate discussion between employees it can also facilitate discussion with the customer on extranets or any other controlled ueser interface.

### Common Message Properties

Property | Type | Description
-------- | ---- | -----------
source | String | Where is the comment originated from? A period separated list representing a source hierarchy. It’s a good rule to structure the source string so that it ranges from the least_specific.to_the.most_specific.<ul><li>Examples:</li><li>com.activitystream.webserver1		(top_level_domain.domain.server)</li><li>com.activitystream.www			(top_level_domain.domain.site)</li><li>as.enhancer.ipLookup 			(system.subsystem.procedure_name)</li></ul>
comment | String | Embedding implicit tags:</br> Tags can be embedded in the comment using the hash tag (#).</br>Embedding implicit relations:</br>The comment it self special characters: @refID looks for an entity referencewith the User/refID or the Employee/refID signatures and automatically adds  “MENTIONES” relations.</br>Examples: Stefán@Employee/stefanb @Customer/311068 @Vehicle/VF058 @stream_id
involves | List<role> | Every comment is related to at least two entities, the entity responsible for making the comment and the business entity that the comment belongs to. Comments can also reference other users or other entities.</br>Supported types are:<ul><li>COMMENTS - the entity that makes the comment</li><li>COMMENTED_ON - the entities that the comment applies to</li><li>MENTIONS - entities referenced or discussed in the comment</li></ul>See Event/Entity Relations for details.
occurred_at | ISO Date | Occurred_at should always be set with server time or left blank to have it set by Activity Stream up on reception..
aspects | Map<S,M> | Aspects are commonly used information snippets which have rich support in Activity Stream both for processing and representation. Each event message can have multiple aspects. </br>Supported aspects: GeoLocation, Classification, Gamification*, Attachments, Locale *Gamification settings are always associated with the one commenting
acl | List<AC> | A list of entities which can see this comment (Access Control List) * If no rule is set then the event is accessible to all users </br>READ is the only option here and the writer (COMMENTS) is the only one with WRITE access by default. Anyone with WRITE access on the target entity (COMMENTED_ON) can remove/hide the comment by altering the ACL rules (nothing is ever permanently removed)

### API
### REST
### Message QUEUE


## Bumps
```javascript
//Simple bump message:
{
  "entities":[
    {"ACTOR":"Employee/lindarut"},
    {"BUMP_UP":"Vehicle:Car/VF058"}
  ]
}

//Bump up an event in the activity stream by stream id:
{
  "entities": [ 
    {"ACTOR":"User/stebax@gmail.com"}, 
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}

//Multiple bumps in one message:
{
  "entities": [ 
    {"ACTOR":"Employee/stefanb"}, 
    {"BUMP_NEUTRAL":"Customer/311068"},
    {"BUMP_DOWN":"Vehicle:Car/VF058"},
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}
```
Bump(s) are essentially the same thing a “like” and a “+1”. It’s a simple way for users to express their opinions regarding stream items (event, entities and comments).

Every bump is a link between exactly two entities, the user-entity responsible for voting/bumping and the stream-item being voted on.
 
Property | Type | Description
-------- | ---- | -----------
actor | Stream Item | Either an <entity_type>/<entity_id> pair or a stream_id.  Examples: Employee/stefanb  a2def97d-f2b0-3dc8-be51-f2a54a1879c3
action:entity | Stream Item | <bump_type>:<entity_type>/<entity_id> <bump_type>:<stream_id>   Action: BUMP_UP BUMP_DOWN BUMP_NEUTRAL


### Common Message Properties
## API
### REST
### Message QUEUE

# Time-Series
```javascript
//Minimal data-point:
//Only stores one metric, “load”, in the “SystemHealth” time serie and adds “server1” as the source dimensions.
{
  "series": "SystemHealth",
  "source": "server1",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "aspects": {
    "ts_data": {
      "load":5.6
    }
  }
}

//Multiple data-points and an entity reference:
//Adds metrics for “tries“ and “importance” to the “CaptchasTooManyFailed” timeseries using the provided time as the precise time for the data-point and with Customer(3110686369) as a dimensions.  This also establishes a link between the customer entity in the historical store and this particular timeseries.
{
  "series": "CaptchasTooManyFailed",
  "source": "as.cep3",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "involves": [{"REFERENCES": "Customer/3110686369"}],
  "aspects": {
    "ts_data": {"tries":1, "importance":3,}
  }
}

//Multiple entity references
//Does the same as the one above except it references more entities in the historical store (Customer/IP)
{
  "series": "CaptchasTooManyFailed",
  "source": "as.cep3",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "involves": [
    {"AFFECTS": "Customer/3110686369"},
    {"REFERENCES": "IP/192.168.1.1"}
  ],
  "aspects": {
    "ts_data": {
       "importance":3,
       "tries":1
    },
    "classification": {"type":"Google"}
  }
}
```
Data points are time-series entries that can be reported individually, in batches or as an integrated part of an event message using the ts_data aspect.

Activity Stream includes a real-time analytics store that is capable of storing data points with multiple dimensions which are available for querying as soon as submitted. 

Think of the AS time series as a OLAP/Cube which is updated continuously and can be sliced and diced at will.

<!--
All events produce analytical information and have their time-series “footprint” but here we referring to traditional timeseries, e.a. a collection of data-points normally emitted by systems at fixed or irregular intervals.
In today’s operational environment there is a rich need to combine arbitrary business-events with machine generated data in order to tie together the “state of the environment” and the events happening in that environment because internal and external factors like system health, weather and time-of-day are all relevant to the “corporate performance” and can provide key contextual information when looking for patterns. 
The ability to store a vast amount of such data and link it to business-entities and -events will become even more critical with the Internet-of-things really starts taking off.
-- Activity Stream, in order to maintain a comprehensive view of both fixed interval events and arbitrary events, stores typical time-series data in addition to event data.
-- Time-series are updated for business-events but raw time-series data (data-points) can also be sent to Activity Stream for processing and storing.      
-->
## Common Message Properties

Property | Type | Description
-------- | ---- | -----------
series | String | The Time-Series label/name. First time a series label is used the timeseries is instantiated and should require no additional preparation.
source | String | Where is the datapoint originated from (Source System). The source becomes a dimension in the time-series entry. Examples: com.activitystream.webserver1	(top_level_domain.domain.server) processing-line-1.scale-1.weight-meter-1 (machine.component.meter)
occurred_at | ISO Date | ISO serialized datetime representing the exact time that the event occurred at the source system. *Handling of data-points in AS differs from other events messages and a default occurred_at value is not provided. This means that the originating system must always provide the correct “measurement time” for data-points.
involves | List<role> | A link between the Entity and the Time-series is created the first time the entity is mentioned in conjunction with the time-series. Relation format: [{"type":"<entity_type>/<entity_id>"}]  Supported types are: - AFFECTS - The entity that the time series value afects (like temperature) - REFERENCES - Entity not directly involved in the ts data but should be Relationship information is  added to the timeseries data as a dimensions, much in the same way as the classification dimensions, but the difference is that entities listed here, and residing in the historical-graph,  are associated/linked with the timeseries for further/later processing.
aspects | Map | The data-point information is separated into 1 to 3 different aspects depending on the nature/purpose of the information. These are some of the same aspects available for AS Event Messages and are documented below.
ts_data | Map | A Key/Value pair representing metric and a value pairs for the time-series where the value is always numeric (double).
classification | Map | A key value pair representing a dimension and the corresponding dimension values.  Dimensions are useful for querying, aggregating and faceting time-series data. 
geo_location | String | A lat,long string containing valid geo coordinates. Simple Geo queries will be supported shortly (they are currently supported as an experimental feature in Druid).


## Time-Series Data (Data-Points)
In addition to be registered in the AS event-entity graph the event updates a time series with this datapoint. 
Please note: For high frequency, fixed interval, time-series we recommend using the DataPoint message rather than sending in regular events with the ts_data aspect.
Additional dimensions are added from Locale, Client Device and GeoLocation. Additional/manual dimensions can be set using the Classification aspect.

## API
### REST
### Message QUEUE
