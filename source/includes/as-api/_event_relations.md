# Event Involvement (Roles)
## Role properties
```shell
A basic event-message reporting a login:
{
  "event": "as.web.access.isp-blocked",
  "involves": [
    {"ACTOR":"Employee/stefanb"},
    {"AFFECTS":"ISP/some-abusing-server-host"}
  ]
}

Proxy for example:
{
  "event": "as.web.pageview",
  "involves": [
    {"ACTOR":"WebSession/23948290348290380", "PROXY_FOR":"Employee/stefanb"}
  ]
}
```
Each event reported to Activity Stream is explicitly linked to the entities that it involves. Sometimes only the "ACTOR" is reported as the entity/user/process responsible for the event taking place. In other occasions the event is linked to numerous entities and their involvement explained using the built in roles or using customer defined roles.      

Property | Type | Description
-------- | ---- | -----------
**role**|String|The Role Type
**entity**|EntityRef|A entity reference like: "Users/3434"
properties | JSON | Any valid JSON structure added to the relationship between the event and the entity.
PROXY_FOR|Entity|Defines a secondary entity that is fronted by the primary entity of the relation</br>Can be used as a shorthand for linking a WebSession to a User (then the WebSession is the ACTOR but it's really a PROXY_FOR a User)

## Predefined Roles
* Basic Event Relations (Roles):
  * **ACTOR**               The Entity responsible for causing the event
  * **AFFECTS**             Event affects the referenced Entity
  * **INVOLVES**            Entity is involved in event (not directly affected)
  * **OBSERVED**           Entity is involved in event (not directly affected)
  * **REFERENCES**          Entity is referenced in the event (not involved or directly affected)
</br>

## Custom Roles
You can subclass any relations type by adding your own type name to the end of the the relationship type you would like to subclass/extend: “OBSERVED:WITNESSED”. Please note that once the “WITNESSED” subclass is created that “WITNESSED” becomes a reserved keyword for this relations type only and that it will always and only extend “OBSERVED”. Plan your customer relationship types carefully.

**Please note:** All role (link-type) labels are unique and can only be defined once. Link-types are always specified/defined in all-caps.
