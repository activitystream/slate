---
title: AS API

language_tabs:
  - json

toc_footers:
  - <h3>AS Documentation:</h3>
  - Activity Stream API
  - <a href='/provisioning.html#'>Provisioning API</a>
  - <a href='/graph.html#'>SQL Graph Queries</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-library.html#'>Library of standard AS messages</a>
  - <a href='/recipes.html#'>Recipes</a>
  - <a href='/details.html#'>Details & references</a>
  
includes:
  - as-api/event_message
  - as-api/entity_message
  - as-api/timeseries_message
  - as-api/comments
  - as-api/bump
  - as-api/entity_relations
  - as-api/notifications
  - as-api/observations
  - as-api/activity_stream
  - as-api/analytics  
  - as-api/aspects
  - as-api/access
  - as-api/advanced_topics
  - as-api/details_and_references

search: true
---

# Introduction
This documentation will help you send events to Activity Stream from any data source using REST API or a Message Queue. It will explain the basics and get you going quickly but will also provide you with the details needed to take full advantage of the Activity Stream platform.

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
A instance of a User, Product, WebPage and Order are all examples of entities. These (Business)entities are automatically created when referenced by an event and then the event, as well as all future events, are linked to the entity. 

That way each event becomes a part of the entities history, its activity stream, that reflects the type of event and the role that the entity played in the event. [Entity-types]() as created just-in-time and can be [sub-classed]() for advanced querying

### Event-Entity Graph
Activity Stream's stores all events in a [graph](). This enables a range of valuable services but it does introduce some requirements on the event-message structure.

### Role
The entities involved in an event all have respective roles. The "ACTOR" is, for example, the entity triggering the event and "AFFECTS" is the role used for all entities directly affected by the event while "REFERENCES" is the role used for entities involved in the event but have no real bearing on the event. [Common roles]() are built into Activity Stream but new [Roles can defined on the fly]().

### Link Type
In Activity Stream any entity can be [linked to any other entity]() and the link between the entities can be typed, have properties and weight. That way a Customer can, for example, be a "OWNER" of a Car. [Common Link types]() are built into Activity Stream but new [Link-Types can defined on the fly]().

### Aspects
[Aspects]() are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation.

### Time-Series
Activity Stream includes a [real-time analytics store]() capable of storing multi-metric, multi-dimensional time-series where new data points are immediately available for [ad-hoc querying]().
Think of the AS analytics store as an dynamic OLAP/Cube which is continuously updated and can be sliced and diced at will. You can submit any TS data to the analytics store as new time-series are created on demand. 

### Observations
[Observations]() are stream items created by the [Observation Engine]() in Activity Streams when it detects situations, threats or opportunities which it has been trained to identify.
These observations become a part of the activity stream for the entities it involves and it's sent to users and systems that have expressed interest in them or the entities involved.

### Notifications
Any User, with sufficient privileges, can [subscribe to events or observations]() of certain types or concerning certain entities and receive notifications when applicable.

### Streaming Analytics
Every message received by Activity Stream is processed and analysed. That process yields a lot af statistical information which is published, via a web-socket and message queue, at fixed intervals. This, along with streaming-events, can be used to build dashboards that are continuously updated and more.        

### Further Reading

* [Provisioning API]()
* [SQL graph queries]()
* [Advanced analytical queries]()
* [A Library of standard AS event-messages ]()
* [Cookbook]()
