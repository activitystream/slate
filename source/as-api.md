---
title: AS API

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - Activity Stream API
  - <a href='/provisioning.html#'>Provisioning API</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-catalog.html#'>AS Event Catalog</a>
  - <a href='/web-analytics.html#'>Web Analytics Utility</a>

includes:
  - as-api/event_message
  - as-api/event_relations
  - as-api/entity_message
  - as-api/entity_relations
  - as-api/aspects
  - as-api/comments
  - as-api/workflow
  - as-api/bump
  - as-api/channels
  - as-api/subscriptions
  - as-api/notifications
  - as-api/provisioning
  - as-api/advanced_topics

search: true
---
# Introduction
This documentation will help you send events to Activity Stream from any data source using REST API or a Message Queue. 
It will explain the basics and get you going quickly but will also provide you with the details needed to take full advantage of the Activity Stream platform.

## Main concepts
Please familiarize yourself with the following before you start constructing your event-messages.

### [Event](#introduction-to-events)
<img align="right" src="/images/event-diagram-1.png">
An event is any event or action reported to Activity Stream by external systems via an event-message.
Each event becomes an item in the activity stream and is associated with all the entities involved in or by the event.
All events represent a specific Action which is created dynamically on first use (just-in-time).

### [Entity](#introduction-to-entities)
Good examples of business entities are Users, Products, WebPages and Orders.</br>
Entity types and entity instances are automatically created the first time they are referenced by an event. 
That way each event becomes a part of the entities history, its activity stream, that reflects the actions reported by any event that involves the entity.

### [Event Relations (Role)](#event-relations)
All entities involved in an event have a role that declares what part they "played" in the event.
</br>The "ACTOR" is, for example, the entity responsible for triggering the event and
</br>the "AFFECTS" role is used for relations to all entities directly affected by the event while
</br>the "REFERENCES" role is used for entities involved in the event but have no real bearing on the event and are not affected by it.

Common ([Predefined](#predefined-roles)) roles are built into Activity Stream, but [custom](#custom-roles) Roles and sub-roles can be defined on the fly.

### [Entity Relations (Link)](#entity-relations)
Any entity can be linked to any other entity and the link between the entities can be **typed**, have **properties** and **weight**.
</br>That way a Customer can, for example, be a "OWNER" of a Car or be synonymous, in terms of event history, with his personal mobile phone. [Common Link types](#predefined-link-types) are built into Activity Stream but [custom Link-Types can be defined on the fly](#custom-link-types).

### [Aspects](#aspects)
Aspects are message extensions which unlock rich support in Activity Stream, both in terms of processing and presentation.
