---
title: Event Message Reference

language_tabs:
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>

includes:
  - event_message
  - entity_message
  - timeseries_message
  - comments
  - bump
  - entity_relations
  - subscriptions
  - observations
  - activity_stream
  - aspects
  - access
  - advanced_topics
  - details_and_references

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
Business-entities are automatically created when referenced by an event. The event, as well as all future events, are then linked to that entity. Each event becomes a part of the entities history, its activity stream, that reflects the type of event and the role that the entity played in the event. [Entity-types]() as created just-in-time and can be [sub-classed]() for advanced querying

### Event-Entity Graph
Activity Stream's stores all events in a [graph](). This enables a range of valuable services but it does introduce some requirements on the event-message structure.

### Role
The entities involved in an event all have respective roles. The "ACTOR" is, for example, the entity triggering the event and "AFFECTS" is the role used for all entities directly affected by the event while "REFERENCES" is the role used for entities involved in the event but have no real bearing on the event. [Common roles]() are built into Activity Stream but new [Roles can defined on the fly]().

### Link Type
In Activity Stream any entity can be [linked to any other entity]() and the link between the entities can be typed, have properties and weight. That way a Customer can, for example, be a "OWNER" of a Car. [Common Link types]() are built into Activity Stream but new [Link-Types can defined on the fly]().

### Message Aspects
[Aspects]() are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation.

### Time-Series
Activity Stream includes a real-time analytics store that is capable of storing data points with multiple dimensions which are available for [ad-hoc querying]() as soon as submitted.
Think of the AS time series as a OLAP/Cube which is continuously updated and can be sliced and diced at will.

### Observations
[Observations]() are stream items added by Activity Streams Observation Engine when analysis detects situations, threats or opportunities it has been trained to spot.

### Subscriptions
Any User, with sufficient privileges, can [subscribe to events or observations]() of certain types or concerning certain entities.

### Further Reading