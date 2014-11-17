# Entity Relations (Links)
Business Entities in the Historical Store (Event-Entity-Graph) can be related to each other in multiple ways. The relationships can be described using a Relationship-class and Relationship-weight.  This allows for advanced graph mining based on both the events related to an entity and the entity relationship to other entities.

Finding the shortest path between entities, common interests and do sophisticated graph mining becomes possible when these relationships are defined/mapped properly.

## Link-message properties
```shell
Simple link-message explicitly defining a 1:1 link between an email and a customer
{
  "entity_ref":"Customer/3110686369",
  "relations": {"AKA":"Email/stefan@activitystream.com"}
}

An example of a more detailed link-message:
{
  "entity_ref":"Customer/3110686369",
  "relations": {
    "AKA":"Email/stefan@activitystream.com",
    "properties":{
      "any":"thing",
      "you":["would","like"],
      "to":{"store":true}
    },
    "active_from":"",
    "active_until":"",
    "weight":5
  }
}
```

Property | Type | Description
-------- | ---- | -----------
**entity_ref**|String|A reference for the source/parent entity 
**relation**|Relation|Format: “TYPE”:”entity_ref” See list of link-types
active_from | DateTime | ISO Date This relations is active from the given date
active_until | ISO Date | This relations is active until the given date 
weight | Double | An additional weight for the relationship (used for advanced graph mining)
properties | JSON | Any valid JSON structure .

**Valid aspects:** None

## Predefined Link Types
* Primary/Abstract  Types
  * **IS**		 		    Exclusive 1:1 relations
  * **KNOWS**				Definitive relationship
  * **KNOWS_OF**			Should know of it's existence
</br></br>

* Basic Entity Relations:
  * **AKA**                 exclusive 1:1 relations (IS) (Extends IS)
  * **PROXY_FOR**          	exclusive 1:1 relations (IS) (Session can be a proxy for a user) (IS)
  * **PART_OF**  			non-exclusive relationship (Membership, employment) (KNOWS)
  * **BELONGS_TO**			non-exclusive relationship (describes ownership/possession) (KNOWS)
  * **RELATED_TO**			Family relations (KNOWS)
  * **ASSOCIATED_WITH**		Has social relations to (less important than family) (KNOWS)
  * **ON_BEHALF_OF**		non-exclusive relations (KNOWS_OF)
  * **HAS_RELATIONS_TO**	Has other relations to (other more distant relations) (KNOWS_OF)
</br></br>

* Interest Relations:
  * **INTEREST**			Abstract Type for expressed interest (Extends KNOWS_OF)
  * **FOLLOWS**    			The source entity follows the destination entity (Extends INTEREST)
  * **MANAGES**		        (Extends INTEREST)

## Custom Link Types
You can subclass any relations type by adding your own type name to the end of the the relationship type you would like to subclass/extend: “INTEREST:TRACKS”. Please note that once the “TRACK” subclass is created that “TRACK” becomes a reserved keyword for this relations type only and that it will always and only extend “INTEREST”. Plan your relationship types carefully.

**Please note:** All link-type labels are unique and can only be used once and that link-types are always upper-case 

## Link entities
## Unlink entities
## Relations queries

## Additional queries and interfaces
* See [Graph Queries]() for information on querying the event-entity graph using SQL.
* See [Aliasing]() for information on how these relations can be used to improved the activity stream 
