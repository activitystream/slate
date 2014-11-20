# Bumps, Likes and Votes
##Introduction to bumps
Bump(s) are essentially the same thing a “like” and a “+1”. It’s a simple way for users to express their opinions regarding stream items (event, entities and comments).

Every bump is a link between exactly two entities, the user-entity responsible for voting/bumping and the stream-item being voted on. 

## Bump-Message Properties
```shell
Simple bump example:
{
  "relations":[
    {"ACTOR":"Employee/lindarut"},
    {"BUMP_UP":"Vehicle:Car/VF058"}
  ]
}

Bump up an event in the stream by stream id:
{
  "relations": [ 
    {"ACTOR":"Employee/stefanb"}, 
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}

Multiple bumps in one message:
{
  "relations": [ 
    {"ACTOR":"Employee/stefanb"}, 
    {"BUMP_DOWN":"Vehicle:Car/VF058"},
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}
```

Property | Type | Description
-------- | ---- | -----------
actor | Entity | Either an <entity_type>/<entity_id> pair or a stream_id.  Examples: Employee/stefanb a2def97d-f2b0-3dc8-be51-f2a54a1879c3 
action:entity | Stream Item | <bump_type>:<entity_type>/<entity_id> or <bump_type>:<stream_id> Action: BUMP_UP BUMP_DOWN  BUMP_NEUTRAL Examples: "BUMP_UP":"Vehicle/VF058" "BUMP_DOWN":"Vehicle/RT050"

**Valid aspects:** None

## Submit via REST API
```shell
Returns this:
{
}
```
`POST` `https://{tenant-label}.activitystream.com/api/collector/v1/bumps?api_key={api-key}`
`Headers` `Content-Type: application/json`

###Check if event-message is validate (Nothing gets persisted)
`POST` `https://{tenant-label}.activitystream.com/api/v1/bumps/validate?api_key={api-key}`

###Request properties
Property | Description
-------- | -----------
{api-key} | Your API (unless pre-authenticated)

Header| Description
-------- | -----------
Content-Type | application/json

## Submit via Message Queue
```shell
Returns nothing except an acknowledgement from the queue that the message has been received.
```
###Connection Settings
Property | Description
-------- | -----------
server | receiverX.activitystream.com (unless you are using a local RabbitMQ cluster)
vhost | {tenant-label} name unless you are using a local RabbitMQ cluster and the it's the same as you configured in AS admin/setup.
exchange | to-activitystream
message_key | as.api.bump

## Bump API

###Fetch all the bumps made by a certain entity:
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/entities/{entity-type}/{entity-id}/bumped?page={page-nr}&pagesize={items-on-page}&filter={filter}&api_key={api-key}`

###Fetch all the bumps for a certain entity:
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/entities/{entity-type}/{entity-id}/bumps?page={page-nr}&pagesize={items-on-page}&filter={filter}&api_key={api-key}`

Property | Description
-------- | -----------
{api-key} | Your API key
{entity-type} | The part of the {entity_ref} that specifies the Entity/Object Type. Car, Customer, Order are all examples of entity types. This is normally the table name in your database or a human readable version of it.
{entity-id} | The unique id of the entity with that entity-type. This is normally the ID of the entity in your database.
{page-nr} | The page number to fetch. 1 is the first page and also the default value.
{items-on-page} | Specifies how many items should be on each page. 20 is the default value and 300 is the maximum value.
{filter} | A SQL filter (where clause) to apply to the result set. Please read [SQL]() for further information on the graph enabled SQL dialect that we use
{tenant-label} | Each Activity Stream customer gets a tenant id. usually this matches the entity part of your email address.

