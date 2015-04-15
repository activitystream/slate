# Comments
##Introduction to comments
A comment can be made regarding any stream item (event, entity or comments) in the activity stream as well as directly on business entities. A single comment can be attached to multiple stream items (targets) and can contain references to entities as well.

Comments provide a way to facilitate business focused discussion on anything that has happened in a social kind of way. In addition to facilitate discussion between employees it can also facilitate discussion with the customer via extra-nets etc.

###Access control
Access Control List is available to control who has access to the comment to accommodate internal, external, grouped and globally available comments alike.

## Comment-Message Properties
```shell
A comment message using explicit setters:
{
  "source":"com.activitystream.www",
  "comment":"This car is not worth much is it mrs. Linda! It looks worthless to me", 
  "involves": [
    {"COMMENTS":"Employee/stefanb"}, 
    {"COMMENTED_ON":"Vehicle/VF058"},
    {"MENTIONS":"Employee/linda"}
  ],
  "aspects":{"tags":["car","worthless"]}
}

Same comment using implicit/embedded setters: 
{
  "source":"com.activitystream.www",
  "comment":"This #car is not worth much is it mrs. Linda@Employee/linda! It looks #worthless to me", 
  "involves": [
    {"COMMENTS":"Employee/stefanb"},
    {"COMMENTED_ON":"Vehicle/VF058"}
  ]
}
```

Property | Type | Description
-------- | ---- | -----------
source | String | Where is the comment originated from? A period separated list representing a source hierarchy. It’s a good rule to structure the source string so that it ranges from the least_specific.to_the.most_specific.
comment | String | Embedding implicit tags: Tags can be embedded in the comment using the hash tag (#). Embedding implicit relations: The comment it self special characters: @refID looks for an entity referencewith the User/refID or the Employee/refID signatures and automatically adds  “MENTIONES” relations. Examples: Stefán@Employee/stefanb @Customer/311068 @Vehicle/VF058 @stream_id
entities | List\<relation\> | Every comment is related to at least two entities, the entity responsible for making the comment and the business entity that the comment belongs to. Comments can also reference other users or other entities. [ {"type":"entity_type/entity_ref"},   {"type":"stream_id"}] Supported types are: COMMENTS 		- the entity that makes the comment COMMENTED_ON 	- the entities that the comment applies to MENTIONES		- entities referenced or discussed in the comment See Event/Entity Relations for details.
occurred_at| DateTime | The exact time that the comment was made (ISO 8601 serialized).</br>*Defaults to local time when received by AS.*
aspects| Map\<Aspect,JSON\>| Aspects optionally contain information that enhance the comment.</br>*See list of [available aspects](#aspects)*

**Valid aspects:** [`Attachments`]() [`ClientDevice`]() [`ClientIp`]() [`GeoLocation`]() [`Locale`]() [`Tags`]()  

## Send via REST API (Synchronous)
```shell
Returns this:
{
TBD
}
```
`POST` `https://<tenant>.activitystream.com/api/v1/as/comments`
## Send via REST API (Asynchronous)
`POST` `https://<tenant>.activitystream.com/api/collector/v1/comments`
###Check if comment-message is validate (Nothing gets persisted)
`POST` `https://<tenant>.activitystream.com/api/v1/as/comments/validate`

###Request properties
Property | Description
-------- | -----------
apikey  | Your API (unless pre-authenticated)
   
## Send via Message Queue
```shell
Returns nothing except an acknowledgement from the queue that the message has been received. Please see information regarding deterministic UUIDs showing how stream_id can be calculate for an event even before if it is sent.   
```
###Connection Settings
Property | Description
-------- | -----------
server | receiverX.activitystream.com (unless you are using a local RabbitMQ cluster)
vhost | {tenant} name unless you are using a local RabbitMQ cluster and the it's the same as you configured in AS admin/setup.
exchange | to-activitystream
message_key | as.api.comment

## Comment REST API
```shell
Returns the comment-message as submitted


Returns a list comments made on a single event



Returns a list comments made on a single entity
```

###Single comment:
`GET` `https://<tenant>.activitystream.com/api/v1/as/comment/{stream-id}`

###List of comments related to a single event (or stream item):
`GET` `https://<tenant>.activitystream.com/api/v1/as/comments/{stream-id}?page={page-nr}&size={items-on-page}`

###List of comments related to a single entity:
`GET` `https://<tenant>.activitystream.com/api/v1/as/comments/{entity-type}/{entity-id}?page={page-nr}&size={items-on-page}`

###List of comments tagged with a particular tag:
`GET` `https://<tenant>.activitystream.com/api/v1/as/comments/tags/{tag}?page={page-nr}&size={items-on-page}`

### Query Properties
Property | Description
-------- | -----------
{entity-type} | The part of the {entity_ref} that specifies the Entity/Object Type. Car, Customer, Order are all examples of entity types. This is normally the table name in your database or a human readable version of it.
{entity-id} | The unique id of the entity with that entity-type. This is normally the ID of the entity in your database.
{page-nr} | The page number to fetch. 1 is the first page and also the default value.
{items-on-page} | Specifies how many items should be on each page. 20 is the default value and 300 is the maximum value.
{stream-id} | The internal ID used by Activity Stream. This is a named UUID version of the {entity-ref}
{tenant-label} | Each Activity Stream customer gets a tenant id. usually this matches the entity part of your email address.
{tag} | The value of the tag (#somestuff) to look up comments for

## Additional queries and interfaces
* See [Streaming updates]() for information on how to subscribe to streaming event updates.
* See [Graph Queries]() for information on querying the event-entity graph using SQL.
* See [Access Control]() for information on changing the ACL for an event.
