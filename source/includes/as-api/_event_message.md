# Events
##Introduction to events
The activity stream is based on events that are sent from various business or operations systems every time something of operational or business relevance happens. These events are sent as event-messages directly to the AS REST API or via a messaging queue.
Each remote-event is represented by a single or more event-messages. The event-message is the basic structure for reporting these events and they rely on semi-structured format that demands certain compliance but also leaves plenty of room for custom information.

## Event-message properties
```shell
A basic event-message reporting a login:
{
  "event": "as.web.login",
  "involves": [
    {"ACTOR":"User/stefanbaxter"},
  ],
  "properties": {
    "method":"linkedin"
  }
}

Simple event-message reporting a page-view:
{
  "event": "as.web.pageview",
  "source": "activitystream.web",
  "occurred_at": "2014-11-10T12:01:02.345Z",
  "involves": [
    {"ACTOR":"Session/KJ982KJ2"},
  ],
  "aspects": {
    "pageview": {
      "url":"http://www.yoursite.com/cat/prod-cat/product",
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
**event** | String | The event type signature</br>*Defaults to message key when received via message queue.*
**involves** | List\<[Involved](#event-involvement)\> | All business entities involved in the event. (customers, orders etc.) 
occurred_at\*| DateTime | ISO 8601 serialized date-time when the event occurred.</br>\*Defaults to local time when received by AS.
properties | JSON | Any JSON structure containing additional (free-format) event information.
source | String | What system+server or service sent the event </br>\*Defaults to \<tenant\>.unspecified when received by AS.
aspects*| Map\<[Aspect](#aspects),Map\>| Aspects do, optionally, contain event information that Activity Stream knows how to enrich, analyse and represent. List of all [available aspects](#aspects)
 | |  **Following are advanced properties**
importance | Integer | The event importance (priority/severity) setting ranging from 0 .. 5.</br>The importance of the Event Type is used if not provided with the event.
acl | List\<AccessRule\> | Access Control List</br>See [access control](#access-control) for details
token | String | Use defaults for this message that have been pre-registered with a token.</br>See [token based defaults](#message-defaults-using-token)
 | |  **Following are read-only properties**
\_stream_id | String | A unique, read-only, streamid for the submitted event.</br>Stream IDs are calculated using [deterministic UUIDs]() (named) that can be calculated on the client side before sending the event.
\_received_at | DataTime | The AS Server time when the event was received and processed.
\_registered_at | DateTime | The AS Server time when the event-message was registered on the server
\_valid | Boolean | Returnes true/false but only when adding new events via the REST
\_errors | List<S> | Returns a list of list of validation warnings and errors for invalid event-messages.

**\*Available Aspects:** [`Attachments`](#attachments), [`Dimensions`](#dimensions), [`Demography`](#demography), [`GEO Location`](#geo-locations),  [`Presentation`](#presentation), [`Summary`](#summary), [`Tags`](#tags), [`Timed`](#timed)

##Reporting Events
Event-messages can be sent directly to to the REST API or to Activity Stream via a messaging queue.

## Send Event-Messages via Message Queue
```shell
Returns nothing except an acknowledgement from the queue that the message has been received. Please see information regarding deterministic UUIDs showing how stream_id can be calculate for an event even before if it is sent.   
```
###Connection Settings
Property | Description
-------- | -----------
server | inbound.activitystream.com (unless you are using a local RabbitMQ cluster)
vhost | `{tenant-label}` name unless you are using a local RabbitMQ cluster and the it's the same as you configured in AS admin/setup.
user | Your MQ-User (Assigned in the AS Admin)
password | Your MQ-User Password (Assigned/Registered in the AS Admin)
exchange | *to-activitystream*
message_key | event-type signature ("as.web.page.browse" in the example above)

## Event API

###Check if event-message is valid [POST]\*:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/validate?apikey=`{api-key}`
</br>\*Nothing gets persisted

###Asynchronously Persist Event [POST]:
https://`{tenant-label}`.activitystream.com/api/collector/v1/events?apikey=`{api-key}`

###Synchrnously Persist Event [POST]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events?apikey=`{api-key}`

###Fetch a single event [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/`{stream-id}`

###Fetch a single event, related entities and enriched data [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/`{stream-id}`/detailed

###Inspect what analytics information was generated for the event [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/events/`{stream-id}`/analytics

###List of events attached to a single entity (See stream API) [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/`{entity-id}`/events?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`

Property | Description
-------- | -----------
`{api-key}`| Your API key
`{entity-ref}`| A unique identifier of an entity that includes the entity-type and a unique entity-id {entity-type}/{entity-id} like "Customer/3110686369"
`{entity-type}`| The part of the {entity_ref} that specifies the Entity/Object Type. Car, Customer, Order are all examples of entity types. This is normally the table name in your database or a human readable version of it.
`{entity-id}`| The unique id of the entity with that entity-type. This is normally the ID of the entity in your database.
`{stream-id}`| The internal ID used by Activity Stream. This is a named UUID version of the {entity-ref}
`{page-nr}`| The page number to fetch. 1 is the first page and also the default value.
`{items-on-page}`| Specifies how many items should be on each page. 20 is the default value and 300 is the maximum value.
`{filter}`| A SQL filter (where clause) to apply to the result set. Please read [SQL]() for further information on the graph enabled SQL dialect that we use
`{tenant-label}`| Each Activity Stream customer gets a tenant id. usually this matches the entity part of your email address.

## Event Types

