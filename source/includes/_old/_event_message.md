# Event Messages
A website login, purchase being made, new order created or client expressing an interest in a product are all examples of events. Typically these events happen at irregular intervals and are collected and associated with the customer, the product or any other business-entities affected, involved or referenced by the event.
Each event is reported by a single or more event-messages which can be sent directly to to the REST API or to Activity Stream via messaging queue.

## JSON Event-Message Properties
```javascript
//A sample message reporting a page-view
{
  "action": "as.web.page.browse",
  "source": "com.activitystream.www",
  "occurred_at": "2014-11-10T12:01:02.345Z",
  "entities": [
    {"ACTOR":"Session/KJ982KJ2", "PROXY_FOR":"Customer/311068"},
  ],
  "aspects": {
    "pageview": {
      "path":"/cat/prod-cat/product",
      "referrer":"http://www.somesite.com/page/ad"
    }
    "client_device": {
      "user_agent":"Mozilla/5.0 ..."
    }
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
**action** | String | The action reported by the message </br>*Defaults to message key when received via message queue.*
**source** | String | What system+server or service sent the event
**entities** | List\<Relation\> | All entities involved in the event.</br>*Details on [Event relations]()*
occurred_at| DateTime | The exact time that the event occurred (ISO 8601 serialized).</br>*Defaults to local time when received by AS.*
aspects| Map\<Aspect,Value\>| Aspects optionally contain event information that Activity Stream knows how to enrich, analyse and represent.</br>*See list of [available aspects]()*
properties | Map\<S,O\> | Any JSON structure containing additional event information in a custom format.
importance | Integer | The event importance (priority/severity) setting ranging from 0 .. 5.</br>*See [property details]() for details*
acl | List\<Rule\> | Access Control List</br>*See [access control](#access-control) for details*
token | String | Use a default message pre-registered with a token. (See [token based defaults](#message-defaults-using-token))

\**[more details on event-message properties]()*

## Post an event-message
`` POST https://<tenant>.activitystream.com/api/v1/events/``

''Fetch single:	<server>/api/v1/events/<id>/  		[GET]''
''Batch test:	<server>/api/v1/verify/events/batch		[POST]''
''Headers:	“Content-Type: application/json”''
''API-key:	<development key> (Not needed right now)''

## Get a single event-message

## Send via Message Queue

## Analytic Queries
