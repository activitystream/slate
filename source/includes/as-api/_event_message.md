# Events
The activity stream is based on events that are sent from various business or operations systems every time something of operational or business relevance/importance happens. These events are sent as event-messages directly to the AS REST API or via messaging queue for extreme circumstances.   Each event is represented by an event-message.
The event-message is the basic structure for these event reports and they rely on semi-structured messages structure that demands certain formation but also leave plenty of room for custom information.

###Aspects
The event-messages can also be enhanced with the use of pluggable elements, called aspects, where common use cases are tackled in a uniform way. We believe that by understanding the fundamentals of your messages and their requirements we can service you in a much better.
If you, for example, use the [Dimension](#dimensions-classification) aspect we know exactly how to enhance your timeseries with relevant information. That way we can have the right analytics information available to you at all times, correct up to the last second and, as another example, by using the Attachment aspect we know how to properly represent the event in the activity stream UI.

###Contextual awareness powered by the Event-Entity Graph
The event-entity graph works best if we also understand who/what is involved in each event. The event-entity graph allows us to analyze event patterns, not only based on frequency or type, but with advanced pattern detection that spans both time and connected entities in the graph.
That way the contextual aspect is improved considerably as well as the temporal.

###Access Control
Access to the events can be controlled in various ways so that events in the stream can be visible to all employees, a group of employees, management, internal auditing or they can even be viewable by the customer on your self-service portal. See the ACL property for further information.
Collaboration and communications with comments (integrated discussion threads)

###Collaboration
Each event in the event stream is a discussion point and the Activity Stream commenting system facilitates such activity. Important events, regardless of what they concern, can be conversations starters just as an Facebook entry can spark conversation amongst friends. If the activity stream is available on the self-service portal it can even extend out to the customer as well without the risk of internal discussion becoming public.

###Event examples
A website login, purchase being made, new order created or client expressing an interest in a product are all examples of events. Typically these events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.

Each event is reported by a single or more event-messages which can be sent directly to to the REST API or to Activity Stream via messaging queue.

## Event-message properties
```shell
Simple event-message reporting a page-view:
{
  "type": "as.web.page.browse",
  "origin": "com.activitystream.www",   
  "occurred_at": "2014-11-10T12:01:02.345Z",
  "entities": [
    {"ACTOR":"Session/KJ982KJ2", "proxy_for":"Customer/311068"},
  ],
  "aspects": {
    "pageview": {
      "path":"/cat/prod-cat/product",
      "referrer":"http://www.somesite.com/page/ad"
    },
    "client_device": {
      "user_agent":"Mozilla/5.0 ..."
    },
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

Property | Type | Description\*
-------- | ---- | -----------
**type** | String | The event-type </br>*Defaults to message key when received via message queue.*
**origin** | String | What system+server or service sent the event
**entities** | List\<Relation\> | All entities involved in the event.</br>*Details on [Event relations](#Event-relations)*
occurred_at| DateTime | The exact time that the event occurred (ISO 8601 serialized).</br>*Defaults to local time when received by AS.*
aspects*| Map\<Aspect,JSON\>| Aspects optionally contain event information that Activity Stream knows how to enrich, analyse and represent.</br>*See list of all [available aspects](#aspects)*
properties | JSON | Any JSON structure containing additional event information in a custom format.
importance | Integer | The event importance (priority/severity) setting ranging from 0 .. 5.</br>0 - 1 - 2 - 3 - 4 - 5
acl | List\<AccessRule\> | Access Control List</br>*See [access control](#access-control) for details*
token | String | Use a default message pre-registered with a token. (See [token based defaults](#message-defaults-using-token))
 | |  **Following are read-only properties**
\_streamid | String | A unique, read-only, streamid for the submitted event.</br>Stream IDs are calculated using [deterministic UUIDs]() (named) that can be calculated on the client side before sending the event.
\_received_at | DataTime | The AS Server time when the event was received and processed (ISO 8601 serialized).
\_registered_at | DateTime | ISO 8601 datetime value with both milliseconds and time zone representing the exact time that the event was registered on the server
\_valid | Boolean | Returned only when adding new events
\_errors | List<S> | Returned only when a new entry is invalid and contains a list of validation errors.

**\*Available Aspects:** [`Attachments`](#attachments), [`Dimensions`](#dimensions), [`Demography`](#demography), [`GEO Location`](#geo-locations),  [`Presentation`](#presentation), [`Summary`](#summary), [`Tags`](#tags), [`Timed`](#timed)

## Submit via REST API
```shell
Returns this:
{
}
```
`POST` `https://<tenant>.activitystream.com/api/collector/v1/events?api_key={api-key}`

###Check if event-message is validate (Nothing gets persisted)
`POST` `https://<tenant>.activitystream.com/api/v1/events/validate`

###Request properties
Property | Description
-------- | -----------
{api-key} | Your API (unless pre-authenticated)
   
## Submit via Message Queue
```shell
Returns nothing except an acknowledgement from the queue that the message has been received. Please see information regarding deterministic UUIDs showing how stream_id can be calculate for an event even before if it is sent.   
```
###Connection Settings
Property | Description
-------- | -----------
server | receiverX.activitystream.com (unless you are using a local RabbitMQ cluster)
vhost | {tenant-label} name unless you are using a local RabbitMQ cluster and the it's the same as you configured in AS admin/setup.
exchange | to-activitystream
message_key | event-type signature ("as.web.page.browse" in the example above)

## Event Query API
```shell
Returns the event-message as submitted


Returns the event-message as submitted a long with information on all linked entities

Returns a json structure showing the analytic entries automatically generated for the entry
```

###Fetch a single event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}`

###Fetch a single event, related entities and enriched data:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/details`

###Shows analytic entries generated for the event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/analytics` 

###List of events attached to a single entity (See stream API):
`GET` `https://<tenant>.activitystream.com/api/v1/as/entities/{entity-type}/{entity-id}/events?page={page-nr}&pagesize={items-on-page}&filter={filter}` 

###List of Comments attached to the event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/comments?page={page-nr}&pagesize={items-on-page}&filter={filter}` 

###List of Bumps attached to the event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/bumps?page={page-nr}&pagesize={items-on-page}&filter={filter}` 

###Single Event by an external id specified in the "identifiable" aspect
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/external-id/{external-id}` 

###All Events by an external batch-id specified in the "identifiable" aspect
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/external-batch-id/{batch-id}` 

### Query Properties
Property | Description
-------- | -----------
{entity-ref} | A unique identifier of an entity that includes the entity-type and a unique entity-id {entity-type}/{entity-id} like "Customer/3110686369"
{entity-type} | The part of the {entity_ref} that specifies the Entity/Object Type. Car, Customer, Order are all examples of entity types. This is normally the table name in your database or a human readable version of it.
{entity-id} | The unique id of the entity with that entity-type. This is normally the ID of the entity in your database.
{stream-id} | The internal ID used by Activity Stream. This is a named UUID version of the {entity-ref}
{page-nr} | The page number to fetch. 1 is the first page and also the default value.
{items-on-page} | Specifies how many items should be on each page. 20 is the default value and 300 is the maximum value.
{filter} | A SQL filter (where clause) to apply to the result set. Please read [SQL]() for further information on the graph enabled SQL dialect that we use
{tenant-label} | Each Activity Stream customer gets a tenant id. usually this matches the entity part of your email address.


## Additional queries and interfaces
* See [Streaming updates]() for information on how to subscribe to streaming event updates.
* See [Graph Queries]() for information on querying the event-entity graph using SQL.
* See [Analytic queries]() for information on fetching analytic information for the submitted events.
* See [Access Control]() for information on changing the ACL for an event.

