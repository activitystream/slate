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
Activity Stream’s main goal is to collect and process data in real time from a number of different data sources to assemble a complete view of what is happening, who is responsible and what effects it’s having. This “big-picture” is used to gain a unique view of events happening across the enterprise, a view which is normally unattainable as data is scattered across numerous systems.

Continuous, cognitive, analysis of this data is performed to detect perishable insights, opportunities and threats so Activity Stream can provide actionable intelligence and observations. These observations are then presented to the right people, or systems, at the right time and in the right context to turn data into information, knowledge and appropriate actions.

For a developer it may help to think of Activity Stream as a centralized system-log that, instead of storing system-related-information, stores business-related-information.

This "biz-log", formally known as the AS Historical Store, supports both arbitrary events and times-eries data. It also has the ability to link events and time-series data to the associated business entities and link business entities to each other. 

It can, for example, be viewed from the perspective of the client, the product, a division/department, a particular event type or any combination there of. It can be used to keep people informed or used for analytical processing that can detect and discover patterns, opportunities, threats and make other observations we call Actionable Intelligence that is produced to reflect on daily operations and draw attention to improvement opportunities.

# Business Events
A business-event is any action/event that takes place during daily operations and has relevance for the organization or its customers. A website login, purchase, order or client expressing an interest in a product are all examples of such events.

These events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the business-event.

Each business-event is represented by a single event-message which can be sent directly to to the REST API or to AS via messaging queue.    
## Common Event Properties
Property | Type | Description 
-------- | ---- | -----------
**type** | String | Event Type (What happened) The type-category of the event specified in lower case and with a dot separated hierarchy. If you are using your own proprietary event types then please think of the type key as a category structure ranging from the least specific to the most specific. Thinking of this as a verb, with a category structure as a prefix, can help :)
**occurred_at** | DateTime | ISO 8601 serialized datetime value with both milliseconds and time zone representing the exact time that the event occurred in the origin/source system. Milliseconds are important to create a unique event signature. occurred_at should only be set using server time. Have it set on the server side rather than sending it from a browser.
**origin** | String | Where is the event originated from? A dot separated list representing a origin hierarchy. It’s a good rule to structure the origin string so that it ranges from the least_specific.to_the.most_specific. (always in lower case) 
**entities** | List\<Relation\> | Every event is related to at least two entities, the entity responsible for the event occurring and the business entity affected/involved by the event. 
properties | Map\<S,O\> | This is where you store all the custom properties that you want to use in further processing. Any JSON structure is valid here and even nested properties can be used in queries. 
aspects | Map\<Aspect,Value\>| Aspects are commonly used information snippets which have rich support in Activity Stream both for processing and representation. Each event message can have multiple aspects. Aspects are a semi-normalized way to store common elements and they make it possible for us to build rich functionalities and user interfaces which services a wide range of users, rather than focusing on very specific needs of few. 

'''Examples: as.ecom.cart.add	(domain.category.subcat.action) as.ecom.auth.sign-up	(domain.category.subcat.action) as.ecom.auth.login	(domain.category.subcat.action)'''
'''Examples: com.activitystream.webserver1	(top_level_domain.domain.server) as.enhancer.ipLookup 		(system.subsystem.procedure_name)'''
'''Events in the activity stream are commonly related to more entities than two business entities. [{"role_type":"entity_type/id", "properties”: {}, "proxy_for":"entity_type/id"}]'''

## Advanced Properties

Property | Type | Description 
-------- | ---- | -----------
importance | Integer | A message importance (priority/severity) setting ranging from 0 .. 5. (5 critical, 4 very important, 3 important, 2 notable, 1 unimportant, 0 auditing only event)  Importance is used for filtering visible events in the activity stream and for emphasising important events. 
acl | List<RULE> | Access Control Settings (See access control) 
token | String | Explicit token reference. (No surrounding hashes, only the token) If the token exists then the observation message is merged with the token defaults before its processed. If an implicit token is found then it’s copied to this field as a usage reference.
payload | Base64 | Additional details regarding the event. **Please note**: The content of payload is compressed and stored using Base64 encoding. It’s returned in the same form as reported but it’s content can not, for this reason, be used in queries.

## API
### REST
### Message QUEUE

# Business Entities
Customers, Orders, Employees, Invoices, Cases, Projects and Documents are all examples  of common business-entities. Each of these entities produces, directly or indirectly, a considerable amount of related events.

Each entity has its own event log, its activity stream, showing all the events that are relevant for it where each event in the activity stream can also be a part of the activity streams of the other entities involved, like the employees, the customer or both.

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
All business events produce analytical information and have their time-series “footprint” but here we referring to traditional timeseries, e.a. a collection of data-points normally emitted by systems at fixed or irregular intervals.

In today’s operational environment there is a rich need to combine arbitrary business-events with machine generated data in order to tie together the “state of the environment” and the events happening in that environment because internal and external factors like system health, weather and time-of-day are all relevant to the “corporate performance” and can provide key contextual information when looking for patterns. 

The ability to store a vast amount of such data and link it to business-entities and -events will become even more critical with the Internet-of-things really starts taking off.

-- Activity Stream, in order to maintain a comprehensive view of both fixed interval events and arbitrary business events, stores typical time-series data in addition to event data. 
-- Time-series are updated for business-events but raw time-series data (data-points) can also be sent to Activity Stream for processing and storing.      

## Time-Series Data (Data-Points)
In addition to be registered in the AS event-entity graph the event updates a time series with this datapoint. 
Please note: For high frequency, fixed interval, time-series we recommend using the DataPoint message rather than sending in regular events with the ts_data aspect.
Additional dimensions are added from Locale, Client Device and GeoLocation. Additional/manual dimensions can be set using the Classification aspect.

## API
### REST
### Message QUEUE
