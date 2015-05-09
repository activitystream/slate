# Event Involvement
## Role properties
```shell
A simple abuse report:
{
  "event": "as.web.access.isp-blocked",
  "involves": [
    {"ACTOR":"Employee/stefanb"},
    {"AFFECTS":"ISP/abusing-isp-id"}
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
Each event reported to Activity Stream can be explicitly linked to the business entities involved. Sometimes only the "ACTOR" entity is reported (the user/customer/process) responsible for the event taking place. 
In other occasions the event is linked to numerous entities and their involvement explained using the built in or customer defined roles.      

Property | Description
-------- | -----------
**involved**|"`ROLE`":"`entity_ref`" - or - "`ROLE`":{`entity`} 
link(s)|"`TYPE`":"`entity_ref`" - or - "`TYPE`":{`entity`} </br>Defines a secondary entity that is fronted by the primary entity of the role</br>It is, for example, used as a shorthand for linking a WebSession to a User (then the WebSession is the ACTOR but it's really a PROXY_FOR a User)

## Predefined Roles
```shell
Linking two entities:
{
  "event": "as.crm.signup.cppleted",
  "involves": [
    {"ACTOR":"Employee/stefanb", "AKA":"Email/ste@some.com"}
  ]
  ...
```
* Basic Roles:
  * **ACTOR**            The Entity responsible for causing the event
  * **AFFECTS**          Event affects the referenced Entity
  * **INVOLVES**         Entity is involved in event (not directly affected)
  * **OBSERVED**         Entity is involved in event (not directly affected)
  * **REFERENCES**       Entity is referenced in the event (not involved or directly affected)
</br>
</br>
* Event Sourcing Roles (Used when reporting entity registration (CRUD) changes):
  * **CREATES**          The affected entity is created as a consequence of this event
  * **UPDATES**          The affected entity is updated as a consequence of this event
  * **REMOVES**          The affected entity is removed/deleted as a consequence of this event

## Custom Roles
You can subclass any relations type by adding your own type name to the end of the the relationship type you would like to subclass/extend: “OBSERVED:WITNESSED”. Please note that once the “WITNESSED” subclass is created that “WITNESSED” becomes a reserved keyword for this relations type only and that it will always and only extend “OBSERVED”. Plan your customer relationship types carefully.

**Please note:** All role (link-type) labels are unique and can only be defined once. Link-types are always specified/defined in all-caps.
