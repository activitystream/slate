# Event Involvement (Roles)

## Role properties

Property | Type | Description
-------- | ---- | -----------
**role**|String|The Role Type
**entity**|EntityRef|A entity reference: "Users/3434"</br> - OR - </br>A entity: {"entity_ref":"User/3434","properties":{"blue":true}}
properties | JSON | Any valid JSON structure .
PROXY_FOR|Entity|A secondary entity that is fronted by the primary entity of the relation</br>Can be used as a shorthand for linking a WebSession to a User

## Predefined Roles
* Basic Event Relations (Roles):
  * **ACTOR**               The Entity responsible for causing the event
  * **AFFECTS**             Event affects the referenced Entity
  * **INVOLVES**            Entity is involved in event (not directly affected)
  * **WITNESSED**           Entity is involved in event (not directly affected)
  * **REFERENCES**          Entity is referenced in the event (not involved or directly affected)
</br></br>

## Custom Roles
You can subclass any relations type by adding your own type name to the end of the the relationship type you would like to subclass/extend: “INTEREST:TRACKS”. Please note that once the “TRACK” subclass is created that “TRACK” becomes a reserved keyword for this relations type only and that it will always and only extend “INTEREST”. Plan your relationship types carefully.

**Please note:** All link-type labels are unique and can only be used once and that link-types are always upper-case
