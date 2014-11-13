# Entity Messages
```javascript
//This event message:
{
  "type": "as.crm.auth.login",
  "origin": "com.activitystream.www",
  "relations": [
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
relations | List<relation> | Entity Relations
aspects | Map | Supported aspects are: Classification, GeoLocation, Presentation, Tags, Locale, Timed, Summary, Attachments. Please see aspect documentation for further information.
properties | JSON | Any custom properties you might want to keep for the entity.

## Update Message
```javascript
{
  "type": "as.entity.update",
  "origin": "as.provisioning.crud",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "relations": [
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



### Common Message Properties
## API
### REST
### Message QUEUE

# Time-Series
```javascript
//Minimal data-point:
//Only stores one metric, “load”, in the “SystemHealth” time serie and adds “server1” as the origin dimensions.
{
  "series": "SystemHealth",
  "origin": "server1",
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
  "origin": "as.cep3",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "relations": [{"REFERENCES": "Customer/3110686369"}],
  "aspects": {
    "ts_data": {"tries":1, "importance":3,}
  }
}

//Multiple entity references
//Does the same as the one above except it references more entities in the historical store (Customer/IP)
{
  "series": "CaptchasTooManyFailed",
  "origin": "as.cep3",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "relations": [
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
origin | String | Where is the datapoint originated from (Source System). The origin becomes a dimension in the time-series entry. Examples: com.activitystream.webserver1	(top_level_domain.domain.server) processing-line-1.scale-1.weight-meter-1 (machine.component.meter)
occurred_at | ISO Date | ISO serialized datetime representing the exact time that the event occurred at the origin/source system. *Handling of data-points in AS differs from other events messages and a default occurred_at value is not provided. This means that the originating system must always provide the correct “measurement time” for data-points.
relations | List<relation> | A link between the Entity and the Time-series is created the first time the entity is mentioned in conjunction with the time-series. Relation format: [{"type":"<entity_type>/<entity_id>"}]  Supported types are: - AFFECTS - The entity that the time series value afects (like temperature) - REFERENCES - Entity not directly involved in the ts data but should be Relationship information is  added to the timeseries data as a dimensions, much in the same way as the classification dimensions, but the difference is that entities listed here, and residing in the historical-graph,  are associated/linked with the timeseries for further/later processing.
aspects | Map | The data-point information is separated into 1 to 3 different aspects depending on the nature/purpose of the information. These are some of the same aspects available for AS Event Messages and are documented below.
ts_data | Map | A Key/Value pair representing metric and a value pairs for the time-series where the value is always numeric (double).
classification | Map | A key value pair representing a dimension and the corresponding dimension values.  Dimensions are useful for querying, aggregating and faceting time-series data.
geo_location | String | A lat,long string containing valid geo coordinates. Simple Geo queries will be supported shortly (they are currently supported as an experimental feature in Druid).
