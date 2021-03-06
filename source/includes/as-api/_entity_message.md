# Entities
##Introduction to entities
Entities (Business objects) represent any object that is referenced by events in the activity stream.
</br> An insurance company would typically, and at least, have Customer, Vehicle, Policy and Claim as entity-types and numerous entities of each entity-type.

Entities, as well as entity-types, are created automatically the first time they are referenced by an event but they can also be created explicitly using REST or by sending entity information in a dedicated entity-message to the message queue.
### Additional entity information
Any JSON information can be stored as the properties of a business entity and when the [aspects](as-api.html#aspects) are used to store them then the entity can be represented by Activity Stream and meaningful information from the entity can be used while processing associated business events.
### Unlimited entity relations
Entities are stored in a graph where even the most complicated relations between entities can be stored in a simple way.
</br>By using the same kind of approach as social-networking sites use to store different types of friendships, and who is following who, we are able to link any entity with any other entity where the relationship types can be customized on the fly.

See [Entity Relations](#entity-relations) for details on how to link and unlink entities
### Full referential integrity
Entities can not be deleted from the Entity Graph but access to them can be controlled using an Access Control List (see the [ACL documentation]() for details).
### Event Sourcing - The ultimate time-machine
Entities are only updated with event/entity messages and each alteration is stored as an event in the activity stream. This allows us to know the state of the entity at any point in time.

## Entity-message properties
```shell
Example of a entity-message that sets various aspects for an Artist
{
  "entity_ref": "Artist/984829",
  "aspects": {
    "presentation":{
      "label":"Jason Aldean",
      "details_url":"https://www.facebook.com/jason.aldean",
      "thumbnail":"http://media.ticketmaster.com/tm/en-us/dbimages/182004a.jpg"
    },
    "summary": {
      "title":"Jason Aldean (the country singer/songwriter)",
      "content":"Jason Aldine Williams (born February 28, ..."
    },
    "demography": {
      "gender":"Male"
    }
    "dimensions": {
      "genre":"Country & Folk",
      "type":"Solo Artist"
    },
    "tags": ["hot","touring"]
  }
  "properties": {
    "something":true,
    "anything":{"you":["might","want"]},
    "everything":"almost"
  }
}
```

Property | Type | Description
-------- | ---- | -----------
entity_ref | EntityRef | {entity-type}/{entity_id} (examples: "Employee/stefanb")
relations | List\<EntityRelation\> | A list of entity relations (links) to be added for the entity (Always additive)
properties | JSON | Any custom properties you might want to store with the entity.
aspects | Map<Aspect,Map>| Aspects used to describe the entity
acl | List\<AccessRule\> | Access Control List</br>*See [access control](#access-control) for details*
 | |  **Following are read-only properties**
*\_streamid* | String | A unique, read-only, stream-id for the entity.</br>Stream IDs are calculated using [deterministic UUIDs]() (named) that can be calculated on the client side before sending the entity.
*\_registered_at* | DateTime | ISO Date when entity registered
*\_last_updated* | DateTime | ISO Date when entity information was last updated

**Available Aspects:** [`Attachments`](#attachments), [`Classification`](#classification), [`Dimensions`](#dimensions), [`Demography`](#demography), [`GEO Location`](#geo-locations),  [`Presentation`](#presentation), [`Summary`](#summary), [`Tags`](#tags), [`Timed`](#timed) 

## Update via Message Queue
```shell
Returns nothing except an acknowledgement from the queue that the message has been received. Please see information regarding deterministic UUIDs showing how stream_id can be calculate for an event even before if it is sent.
```
###Connection Settings
Property | Description
-------- | -----------
server | inbound.activitystream.com (unless you are using a local RabbitMQ cluster)
vhost | {tenant-label} name unless you are using a local RabbitMQ cluster and the it's the same as you configured in AS admin/setup.
exchange | to-activitystream
message_key | as.api.entity

## Entity API

###Update or add an entity (Asynchronous) [POST]\*
https://`{tenant-label}`.activitystream.com/api/collector/v1/entities?apikey=`{api-key}`
\*Requests are relayed via message queue 

###Check if entity-message is validate [POST]\*
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/validate?apikey=`{api-key}`
\*Nothing gets persisted

###Update an entity (Synchronous) [PUT]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/`{entity-id}`?apikey=`{api-key}`
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/?apikey=`{api-key}`\*
\*JSON must contain valid entity_ref 

###Fetch a single entity by entity reference [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/`{entity-id}`?apikey=`{api-key}`

###Fetch a list of entity by a entity type [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`?page=`{page-nr}`&size=`{items-on-page}`&q=`{filter}`&apikey=`{api-key}`

###Fetch a single entity by Stream ID [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{stream-id}`?apikey=`{api-key}`

###Fetch a list of entities by a comma separated list of entity references [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/?ids=`<entity-type>`/`<entitiy-id>`,`<entity-type>`/`<entity-id>`...&apikey=`{api-key}`

###Fetch a list of entities by a comma separated list of entity ids [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/?ids=`<entity-id>`,`<entity-id>`...&apikey=`{api-key}`

###List of Links (Entity Relations) for the entity [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/`{entity-id}`/links?type=`{link-types}`&direction=`{link-direction}`&page=`{page-nr}`&size=`{items-on-page}`&q=`{filter}`&apikey=`{api-key}`

Property | Description
-------- | -----------
`{api-key}`| Your API key
`{entity-type}`| The part of the {entity_ref} that specifies the Entity/Object Type. Car, Customer, Order are all examples of entity types. This is normally the table name in your database or a human readable version of it.
`{entity-id}`| The unique id of the entity with that entity-type. This is normally the ID of the entity in your database.
`{stream-id}`| The internal ID used by Activity Stream. This is a named UUID version of the {entity-ref}
`{link-types}`| A comma separated list of link types. Subtypes are selected for any specified parent type. Defaults to **all**.
`{link-direction}`| Links can be Inbound, Outbound or Both. (values: IN / OUT / BOTH). Defaults to **both**.
`{page-nr}`| The page number to fetch. 1 is the first page and also the default value.
`{items-on-page}`| Specifies how many items should be on each page. 20 is the default value and 300 is the maximum value.
`{filter}`| A SQL filter (where clause) to apply to the result set. Please read [SQL]() for further information on the graph enabled SQL dialect that we use
`{tenant-label}`| Each Activity Stream customer gets a tenant id. usually this matches the entity part of your email address.

