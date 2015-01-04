# Links (Entity Relations)
Business Entities, in the Event-Entity-Graph, can be related to each other in multiple ways. The relationships can be described using a Relationship-type and Relationship-weight.
</br>This allows for advanced graph mining based on both the events related to an entity and the entity relationship to other entities.

## Link-message properties
```shell
Simple link-message explicitly defining a 1:1 link between an email and a customer
{
  "entity_ref":"Customer/3110686369",
  "links": {"AKA":"Email/stefan@activitystream.com"}
}

An example of a more detailed link-message:
{
  "entity_ref":"Customer/3110686369",
  "links": [
    {
      "AKA":{"entity_ref":"Email/stefan@activitystream.com"},
      "properties":{
        "any":"thing",
        "you":["would","like"],
        "to":{"store":true}
      },
      "active_from":"2014-12-01T15:40:00.000z",
      "active_until":null,
      "weight":5
    }
  ]
}
```

Property | Type | Description
-------- | ---- | -----------
**entity_ref**|String|A reference for the source/parent entity 
**links**|Relation...|Format: "TYPE":{entity} See list of link-types
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

* Basic Entity Relations (Links):
  * **AKA**                 exclusive 1:1 relations (Extends IS) (**A**lso **K**now **A**s)
  * **PROXY_FOR**          	exclusive 1:1 relations (Extends IS) (WebSession can be a proxy for a user)
  * **PART_OF**  			non-exclusive relationship (Extends KNOWS) (Membership, employment)
  * **BELONGS_TO**			non-exclusive relationship (Extends KNOWS) (describes ownership/possession)
  * **RELATED_TO**			Family relations (Extends KNOWS)
  * **ASSOCIATED_WITH**		Has social relations to(Extends KNOWS)
  * **ON_BEHALF_OF**		non-exclusive relations (Extends KNOWS_OF)
  * **HAS_RELATIONS_TO**	Has other relations to (Extends KNOWS_OF) (other more distant relations)
</br></br>

## Custom Link Types
You can subclass any link type by adding your own type name to the end of the the relationship type you would like to subclass/extend: "RELATED_TO:MOTHER".
</br>Once the "MOTHER" subclass is created "MOTHER" becomes a reserved keyword for this relations type and it will always and only extend "RELATED_TO".

**Please note:** All link-type labels are unique and can only be used once and that link-types are always upper-case

## Link entities
## Unlink entities
## Relations queries

## Additional queries and interfaces
* See [Graph Queries]() for information on querying the event-entity graph using SQL.
* See [Aliasing]() for information on how these relations can be used to improved the activity stream 
