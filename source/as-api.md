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
  - as-api/event_relations
  - as-api/entity_message
  - as-api/entity_relations
  - as-api/aspects
  - as-api/activity_stream
  - as-api/advanced_topics

search: true
---
# Introduction
This documentation will help you send events to Activity Stream from any data source using REST API or a Message Queue. It will explain the basics and get you going quickly but will also provide you with the details needed to take full advantage of the Activity Stream platform.

## Main concepts
Please familiarize yourself with the following before you start constructing your event-messages.

### [Events](#introduction-to-events)
<img align="right" src="/images/event-diagram-1.png">
A event is any event or action reported to Activity Stream from an external systems via an event-message.
Each event becomes and item in the activity stream and is associated with all the entities involved in or by the event.
All events are of specific [Event-types]() which are created dynamically on first use (just-in-time).

### [Entities](#introduction-to-entities)
A instance of a User, Product, WebPage and Order are all examples of entities.</br>
These (Business)entities are automatically created, just-in-time, when referenced by an event and then the event, as well as all future events, are linked to the entity.

That way each event becomes a part of the entities history, its activity stream, that reflects the type of event and the role that the entity played in the event.

### [Roles (Event Relations)](#roles-event-relations)
The entities involved in an event all have respective roles.
</br>The "ACTOR" is, for example, the entity responsible for triggering the event and
</br>the "AFFECTS" role is used for relations to all entities directly affected by the event while
</br>the "REFERENCES" role is used for entities involved in the event but have no real bearing on the event and are not affected by it.
</br>[Common roles]() are built into Activity Stream but custom [Roles and sub-roles can defined on the fly]().

### [Links (Entity Relations)](#links-entity-relations)
Any entity can be linked to any other entity and the link between the entities can be **typed**, have **properties** and **weight**.
</br>That way a Customer can, for example, be a "OWNER" of a Car or be synonymous, in terms of event history, with his personal mobile phone. [Common Link types](#predefined-link-types) are built into Activity Stream but [custom Link-Types can defined on the fly](#custom-link-types).

### [Aspects](#aspects)
Aspects are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation.
