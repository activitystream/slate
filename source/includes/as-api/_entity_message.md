# Entities
##Introduction to entities
Entities (Business objects) represent any object that are references by events in the activity stream. An insurance company would typically, and at least, have Customer, Vehicle, Policy and Claim as entity-types and numerous instances of each type.

Entities, as well as [entity-types](), are created automatically the first time they are referenced by an event but they can also be create explicitly using REST or by sending entity information in a dedicated message to the message queue.
### Additional entity information
Any JSON information can be stored as properties of a business entity and when the [Aspects]() are used to store them then the Entity can be represented by Activity Stream and meaningful information from the entity can be used while processing associated Business Events.
### Unlimited entity relations
Entities are stored in a graph where even the most complicated relations between entities can be stored in a simple way. By using the same kind of approach as social-networking sites use, to store different types of friendships and who is following who, we are able to link any entity with any other entity where the relationship types can be customized on the fly.

See [adding and removing Entity Relations]() for details on how to link and unlink entities
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
entity_ref | entity_ref | {entity-type}>/{entity_id} (examples: "Employee/stefanb")
properties | JSON | Any custom properties you might want to keep for the entity.
aspects | Map<Aspect,Map>| Aspects used to describe the entity
 | |  **Following are read-only properties**
*\_streamid* | String | A unique, read-only, stream-id for the entity.</br>Stream IDs are calculated using [deterministic UUIDs]() (named) that can be calculated on the client side before sending the entity.
*\_registered_at* | DateTime | ISO Date when entity registered
*\_last_updated* | DateTime | ISO Date when entity information was last updated

**Available Aspects:** [`Attachments`](#attachments), [`Dimensions`](#dimensions), [`Demography`](#demography), [`GEO Location`](#geo-locations),  [`Presentation`](#presentation), [`Summary`](#summary), [`Tags`](#tags), [`Timed`](#timed) 

## Post entity information

## Send via Message Queue
## Update with an event-message
## Entity queries
## Analytic queries
## Streaming updates
