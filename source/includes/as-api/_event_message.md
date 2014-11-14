# Events
A website login, purchase being made, new order created or client expressing an interest in a product are all examples of events. Typically these events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.

Each event is reported by a single or more event-messages which can be sent directly to to the REST API or to Activity Stream via messaging queue.

## Event message properties
```shell
Simple event-message reporting a page-view
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
**entities** | List\<Relation\> | All entities involved in the event.</br>*Details on [Event relations]()*
occurred_at| DateTime | The exact time that the event occurred (ISO 8601 serialized).</br>*Defaults to local time when received by AS.*
aspects| Map\<Aspect,JSON\>| Aspects optionally contain event information that Activity Stream knows how to enrich, analyse and represent.</br>*See list of [available aspects]()*
properties | JSON | Any JSON structure containing additional event information in a custom format.
importance | Integer | The event importance (priority/severity) setting ranging from 0 .. 5.</br>*See [property details]() for details*
acl | List\<AccessRule\> | Access Control List</br>*See [access control](#access-control) for details*
token | String | Use a default message pre-registered with a token. (See [token based defaults](#message-defaults-using-token))

## Post via REST API
```shell
returns this:
{
}
```
`POST` `https://<tenant>.activitystream.com/api/collector/v1/events`

###Request properties
Property | Description
-------- | -----------
api_key  | Your API (unless pre-authenticated)
   
## Send via Message Queue
```shell
returns nothing
```
###Settings
Property | Description
-------- | -----------
vhost | Same as configured in AS admin/setup
exchange | to-activitystream
message_key | event-type signature ("as.web.page.browse" in the example above)

## Event queries
```shell
Returns the event-message as submitted


Returns the event-message as submitted a long with information on all linked entities

Returns a json structure showing the analytic entries automatically generated for the entry
```

###Single event message:
`POST` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}`

###Single event message and related entities:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/details`

###Shows analytic entries generated for the event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/analytics` 

###List of Comments attached to the event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/comments?page={page-nr}&pagesize={items-on-page}` 

###List of Bumps attached to the event:
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/{stream-id}/bumps?page={page-nr}&pagesize={items-on-page}` 

###Single Event by an external id specified in the "identafiable" aspect
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/external-id/{external-id}` 

###All Events by an external batch-id specified in the "identafiable" aspect
`GET` `https://<tenant>.activitystream.com/api/v1/as/events/external-batch-id/{batch-id}` 

* See [Graph Queries]() for information on querying the event-entity graph using SQL
* See [Access Control]() for information on changing the ACL for an event

## Analytic queries
## Streaming updates
