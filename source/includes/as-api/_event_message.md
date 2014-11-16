# Events
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
aspects| Map\<Aspect,JSON\>| Aspects optionally contain event information that Activity Stream knows how to enrich, analyse and represent.</br>*See list of [available aspects](#aspects)*
properties | JSON | Any JSON structure containing additional event information in a custom format.
importance | Integer | The event importance (priority/severity) setting ranging from 0 .. 5.</br>0 - 1 - 2 - 3 - 4 - 5
acl | List\<AccessRule\> | Access Control List</br>*See [access control](#access-control) for details*
token | String | Use a default message pre-registered with a token. (See [token based defaults](#message-defaults-using-token))
\_streamid | String | A unique, read-only, streamid for the submitted event.</br>Stream IDs are calculated using [deterministic UUIDs]() (named) that can be calculated on the client side before sending the event.
\_received_at | DataTime | The AS Server time when the event was received and processed (ISO 8601 serialized).

**Available Aspects:** [`Timed`](#timed), [`Locale`](#timed)

## Send via REST API
```shell
Returns this:
{
}
```
`POST` `https://<tenant>.activitystream.com/api/collector/v1/events`

###Check if event-message is validate (Nothing gets persisted)
`POST` `https://<tenant>.activitystream.com/api/v1/events/validate`

###Request properties
Property | Description
-------- | -----------
api_key  | Your API (unless pre-authenticated)
   
## Send via Message Queue
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
{entityt-ype} |  
{entity-id} |
{stream-id} |
{page-nr} |
{items-on-page} |
{filter} |
{tenant-label} | 


## Additional queries and interfaces
* See [Streaming updates]() for information on how to subscribe to streaming event updates.
* See [Graph Queries]() for information on querying the event-entity graph using SQL.
* See [Analytic queries]() for information on fetching analytic information for the submitted events.
* See [Access Control]() for information on changing the ACL for an event.

