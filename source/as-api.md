---
title: AS API

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - Activity Stream API
  - <a href='/provisioning.html#'>Provisioning API</a>
  - <a href='/graph.html#'>SQL Graph Queries</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-catalog.html#'>The AS Event-Type Catalog</a>
  - <a href='/recipes.html#'>Recipes</a>
  - <a href='/details.html#'>Details & references</a>
  
includes:
  - as-api/event_message
  - as-api/entity_message
  - as-api/timeseries_message
  - as-api/comments
  - as-api/bump
  - as-api/event_relations
  - as-api/entity_relations
  - as-api/notifications
  - as-api/observations
  - as-api/aspects
  - as-api/activity_stream
  - as-api/streaming
  - as-api/access
  - as-api/advanced_topics

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
Activity Stream's stores all events in its [Historical Store]() which is graph based. This enables a range of valuable services but it does introduce some requirements on the event-message structure.

### Role
The entities involved in an event all have respective roles. The "ACTOR" is, for example, the entity triggering the event and the "AFFECTS" role is used for all entities directly affected by the event while the "REFERENCES" role is used for entities involved in the event but have no real bearing on the event. [Common roles]() are built into Activity Stream but custom [Roles can defined on the fly]().

### Link Type
Any entity can be [linked to any other entity]() and the link between the entities can be typed, have properties and weight. That way a Customer can, for example, be a "OWNER" of a Car or be synonymous, in terms of event history, with his personal mobile phone. [Common Link types]() are built into Activity Stream but custom [Link-Types can defined on the fly]().

### Message Aspects
[Aspects](#aspects) are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation.

### Time-Series
Activity Stream includes a [real-time analytics store]() capable of storing multi-metric, multi-dimensional time-series where new data points are immediately available for [ad-hoc querying]().
Think of the AS analytics store as an dynamic OLAP/Cube which is continuously updated and can be sliced and diced at will. 

Analytic information for submitted event-messages are immediately available and messages containing purchase information, page-views and ab-testing information are represented in purpose build analytic models. You can submit any data-points to the analytics which creates new time-series on demand. 

### Observations
[Observations]() are stream items created by the [Observation Engine]() when it detects situations, threats or opportunities which it has been trained to identify.
These observations become a part of the activity stream for the entities it involves and it's sent to users and systems that have expressed interest in them or the entities involved. This is the preferred way to deliver actionable intelligence to users but observations are sent directly to systems, via message queue, as well.

### Notifications
Any User, with sufficient privileges, can [subscribe to events or observations]() of certain types or concerning certain entities and receive notifications when applicable. 

### Stream_ID
Every peace of data belonging to the activity stream has a stream_id. This applies to events, entities, comments, bumps, subscriptions and more. To improve tracking and consistency the Stream IDs are calculated using [deterministic UUIDs]() (named) that can be pre-calculated for any object, even before sending it to Activity Stream.         


### Streaming Analytics
Every message received by Activity Stream is processed and analysed. That process yields a lot af statistical information which is published, via a web-socket and message queue, at fixed intervals. This, along with streaming-events, can be used to build dashboards that are continuously updated and more.        
