# Entity Relations (Links)
Business Entities, in the Event-Entity-Graph, can be related to each other in multiple ways. The relationships can be described using a Relationship-Type and Relationship-Weight which  allows for advanced graph mining based on both the events related to an entity and the entity relationship to other entities.

Relations messages, as detailed here, can be sent to link any Entities in Activity Stream.

## Relations properties
```shell
Simple link-message explicitly defining a 1:1 link between an email and a customer
{
  "entity_ref":"Customer/3110686369",
  "relation": {"AKA":"Email/stefan@activitystream.com"}
}

An example of a more detailed relations-message with the option of specifying multiple relations in a single message:
{
  "entity_ref":"Customer/3110686369",
  "relation": [
    {
      "AKA":"Email/stefan@activitystream.com",
      "properties":{ "any":"thing" },
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
**relation**|\<EntityRelation\>|Format: "\<RELATIONS-TYPE\>":"\<entity-reference\>" </br>\*See the list of relation-types below
active_from | DateTime | ISO Date This relations is active from the given date
active_until | ISO Date | This relations is active until the given date 
weight | Double | An additional weight for the relationship (used for advanced graph mining)
properties | JSON | Any valid JSON structure .

**Valid aspects:** None

## Predefined Relationship Types
* Abstract Types (Primary)
  * **IS**		 		    Exclusive 1:1 relations
  * **KNOWS**				Definitive relationship
  * **KNOWS_OF**			Should know of it's existence
</br></br>

* Basic Relationship Types:
  * **AKA**                 exclusive 1:1 relations (Extends IS) (**A**lso **K**now **A**s)
  * **PROXY_FOR**          	exclusive 1:1 relations (Extends **IS**) (WebSession can be a proxy for a user)
  * **PART_OF**  			non-exclusive relationship (Extends **KNOWS**) (Membership, employment)
  * **BELONGS_TO**			non-exclusive relationship (Extends **KNOWS**) (describes ownership/possession)
  * **RELATED_TO**			Family relations (Extends **KNOWS**)
  * **ASSOCIATED_WITH**		Has social relations to (Extends **KNOWS**)
  * **ON_BEHALF_OF**		non-exclusive relations (Extends **KNOWS_OF**)
  * **HAS_RELATIONS_TO**	Has other relations to (Extends **KNOWS_OF**) (other more distant relations)
</br></br>

## Custom Relationship Types
You can subclass any relationship type by adding your own type name to the end of the the relationship type you would like to subclass/extend: "RELATED_TO:MOTHER".
</br>Once the "MOTHER" subclass is created "MOTHER" becomes a reserved keyword for this relations type and it will always and only extend "RELATED_TO".

**Please note:** All relationship-types are unique and can only be used once and that relationship-types are always specified in all-caps.

## Link API

