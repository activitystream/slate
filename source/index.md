---
title: Event Message Reference

language_tabs:
  - ruby  
  - python
  - json

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>

includes:
  - aspects
  - sending
  - recipes
  - advanced

search: true
---

# Introduction
Activity Stream’s main goal is to collect data in real time from a number of different data sources to assemble a complete view of what is happening, who is responsible and what effects it’s having. This “big-picture” is used to gain a unique view of events happening across the enterprise, a view which is normally unattainable as data is scattered across numerous systems.

Continuous, cognitive, analysis of this data is performed to detect perishable insights, opportunities and threats so Activity Stream can provide actionable intelligence and observations which are are presented to the right people, or systems, at the right time and in the right context to turn data into information, knowledge and appropriate actions.

For a developer it may help to think of Activity Stream as a centralized system-log that, instead of storing system-related-information, stores business-related-information. This "biz-log", formally known as the AS Historical Store, supports both arbitrary events and times-eries data. It also has the ability to link events and time-series data to the associated business entities and link business entities to each other.

<!-- It can, for example, be viewed from the perspective of the client, the product, a division/department, a particular event type or any combination there of. It can be used to keep people informed or used for analytical processing that can detect and discover patterns, opportunities, threats and make other observations we call Actionable Intelligence that is produced to reflect on daily operations and draw attention to improvement opportunities. -->
# Events
A event is any event/action taking place that during daily operations and has relevance for the organization or its customers. A website login, complete purchase, new order or client expressing an interest in a product are all examples of such events.

These events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.

Each event is reported by a single or more event-messages which can be sent directly to to the REST API or to Activity Stream via messaging queue.
## Common Event Message Properties
```json
{
  "type": "as.web.page.browse",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-11-10T12:01:02.345Z",
  "entities": [
    {"ACTOR":"User/stefanb"}
  ],
  "aspects": {
    "pageview": {
      "path":"/cat/prod-cat/product",
      "referrer":"http://www.somesite.com/page/ad"
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
**type** | String | Identifies the type of the event</br></br>**Example:** as.web.page.browse (*domain.category.subcat.action*)<br><ul><li>Dot separated hierarchy</li><li>Ranges from the least specific to the most specific</li><li>Specified in lower case</li></ul>When constructing your own event-types it can help to think of these as a hierarchical category structure where the last part as a verb.
**origin** | String | Identifies where the event is originated from.</br></br>**Example:** com.activitystream.webserver1 *(tld.domain.host)*</br><ul><li>A dot separated list representing a origin hierarchy.</li><li>Ranges from the least_specific.to_the.most_specific</li><li>Specified in lower case</li></ul>
**occurred_at** | DateTime | The exact time that the event occurred</br><ul><li>ISO 8601 serialized datetime</li><li>Includes milliseconds\* and time zone</li><li>Set by the origin/source system.</li></ul>\**Milliseconds are important to create a unique event signature (UUID)*.
**entities** | List\<Relation\> | Lists all entities somehow involved in the event.<br><br>Every involved entity is listed with the role (relations-type) it had in the event. All events have at least an ACTOR.</br></br>Please view this detailed list of built-in roles (relation-types).
aspects | Map\<Aspect,Value\>| Aspects are commonly used information snippets which have rich support in Activity Stream for processing, analysis and representation.</br></br>Please view this detailed list of aspects.
properties | Map\<S,O\> | Any JSON structure can be used to store custom properties not stored as aspects.

## Advanced Properties
```json
{
  "type": "as.web.page.browse",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {"ACTOR":"User/stefanb"}
  ],
  "aspects": {
    "pageview": {
      "path":"/something/classified"
    }
  },
  "importance": 5,
  "acl": [{"READ":"User/stefanb"}]
}
```
Property | Type | Description
-------- | ---- | -----------
importance | Integer | A message importance (priority/severity) setting ranging from 0 .. 5. <ul><li>5 critical</li><li>4 very important</li><li>3 important</li><li>2 notable</li><li>1 unimportant</li><li>0 auditing only event</li></ul>Importance is used for filtering visible events in the activity stream and for emphasising important events. Importance can be set globally for the event type or for individual events.
acl | List\<Rule\> | Access Control List (See access control)
token | String | If defaults have been provided for the token then the new message is merged with those defaults before its processed. (See token based defaults)
payload | Base64 | Additional details regarding the event.<br><br> **Please note**: The content of payload is compressed and stored using Base64 encoding. It’s returned in the same form as reported but it’s content can not, for this reason, be used in queries.

## API
### REST
### Message QUEUE

# Entities
Users, Customers, Orders, Employees, Invoices, Cases, Projects and Documents are all examples  of common (business) entities. Each entity produces or is affected by a considerable amount of events.

Each entity has its own even-log, its activity stream, showing all the events that are relevant for it where each event in the activity stream can also be a part of the activity streams of the other entities involved, like the employees, the customer or both.

It’s important to understand that all business-entities have both implicit and explicit links between them. 

An example of an implicit link is a order as it links the customer with the corresponding products, the employee handling the order with the customer and so forth. An account representative in charge of a customers account has an explicit relationship with the customer.

Capturing all of this in a graph is a valuable trade of Activity Stream. There it can be analyzed and mined in details greater than traditional systems can offer. 

-- //Each event is influenced by or influences some business-entities (a customer, order, task etc.) and these entities are referenced by these events. Activity Stream dynamically build a model of all entities so their event history can be analysed and presented. So the first time an entity is referenced by an event it is created and all subsequent events are attached to it. 

## Common Entity Properties
## Update
## Link
## API
### REST
### Message QUEUE

# Roles & Relations

# Collaboration
## Comments
A comment can be made regarding any event in Activity Stream as well as directly on business entities. A single comment can be attached to multiple targets and can contain detailed information and references to users etc.

Comments provide a way to facilitate business focused discussion on anything that has happened in a social kind of way. In addition to facilitate discussion between employees it can also facilitate discussion with the customer on extranets or any other controlled ueser interface.
### Common Properties

## Bumps
Bump(s) are essentially the same thing a “like” and a “+1”. It’s a simple way for users to express their opinions regarding stream items (event, entities and comments).

Every bump is a link between exactly two entities, the user-entity responsible for voting/bumping and the stream-item being voted on. 
### Common Properties
## API
### REST
### Message QUEUE

# Time-Series
All events produce analytical information and have their time-series “footprint” but here we referring to traditional timeseries, e.a. a collection of data-points normally emitted by systems at fixed or irregular intervals.

In today’s operational environment there is a rich need to combine arbitrary business-events with machine generated data in order to tie together the “state of the environment” and the events happening in that environment because internal and external factors like system health, weather and time-of-day are all relevant to the “corporate performance” and can provide key contextual information when looking for patterns. 

The ability to store a vast amount of such data and link it to business-entities and -events will become even more critical with the Internet-of-things really starts taking off.

-- Activity Stream, in order to maintain a comprehensive view of both fixed interval events and arbitrary events, stores typical time-series data in addition to event data.
-- Time-series are updated for business-events but raw time-series data (data-points) can also be sent to Activity Stream for processing and storing.      

## Time-Series Data (Data-Points)
In addition to be registered in the AS event-entity graph the event updates a time series with this datapoint. 
Please note: For high frequency, fixed interval, time-series we recommend using the DataPoint message rather than sending in regular events with the ts_data aspect.
Additional dimensions are added from Locale, Client Device and GeoLocation. Additional/manual dimensions can be set using the Classification aspect.

## API
### REST
### Message QUEUE
