# Collaboration Messages
## Comments
```javascript
//Minimal comment message:
{
  "origin":"com.activitystream.www",
  "relations": [
    {"COMMENTS":"Employee/stefan@flaumur.is"},
    {"COMMENTED_ON":"Vehicle/VF058"}
  ],
  "comment":"Some ride this is!"
}

//Minimal comment using a stream_id to identify a event:
{
  "origin":"com.activitystream.www",
  "relations": [
      {"COMMENTS":"Employee/lindarut"},
      {"COMMENTED_ON":"a2def97d-f2b0-3dc8-be51-f2a54a1879c3"}
  ],
  "comment":"This car is great, does it come in gold?"
}

// Comment on a customer entity:
{
  "origin":"com.activitystream.www",
  "relations": [
    {"COMMENTS":"Employee/stefan@flaumur.is"},
    {"COMMENTED_ON":"Customer/3110686369"}
  ],
  "comment":"I’ll be back!"
}

//Comment with tags and with explicit references to other employee:
{
  "origin":"com.activitystream.www",
  "relations": [
    {"COMMENTS":"Employee/stefanb"},
    {"MENTIONS":"Employee/sbaxter"},
    {"COMMENTED_ON":"Vehicle/VF058"}
  ],
  "aspects":{"tags":["smu","fleh"]},
  "comment":"This car is great, does it come in gold?"
}

//Comment with tags and implicit/embedded reference to another employee:
{
  "origin":"com.activitystream.www",
  "relations": [
    {"COMMENTS":"Employee/stefanb"},
    {"COMMENTED_ON":"Vehicle/VF058"}
  ],
  "comment":"This car is great, does it come in gold @Employee/lindarut? #smu #fleh"
}
```
A comment can be made regarding any event in Activity Stream as well as directly on business entities. A single comment can be attached to multiple targets and can contain detailed information and references to users etc.

Comments provide a way to facilitate business focused discussion on anything that has happened in a social kind of way. In addition to facilitate discussion between employees it can also facilitate discussion with the customer on extranets or any other controlled ueser interface.

### Common Message Properties

Property | Type | Description
-------- | ---- | -----------
origin | String | Where is the comment originated from? A period separated list representing a origin hierarchy. It’s a good rule to structure the origin string so that it ranges from the least_specific.to_the.most_specific.<ul><li>Examples:</li><li>com.activitystream.webserver1		(top_level_domain.domain.server)</li><li>com.activitystream.www			(top_level_domain.domain.site)</li><li>as.enhancer.ipLookup 			(system.subsystem.procedure_name)</li></ul>
comment | String | Embedding implicit tags:</br> Tags can be embedded in the comment using the hash tag (#).</br>Embedding implicit relations:</br>The comment it self special characters: @refID looks for an entity referencewith the User/refID or the Employee/refID signatures and automatically adds  “MENTIONES” relations.</br>Examples: Stefán@Employee/stefanb @Customer/311068 @Vehicle/VF058 @stream_id
relations | List<relation> | Every comment is related to at least two entities, the entity responsible for making the comment and the business entity that the comment belongs to. Comments can also reference other users or other entities.</br>Supported types are:<ul><li>COMMENTS - the entity that makes the comment</li><li>COMMENTED_ON - the entities that the comment applies to</li><li>MENTIONS - entities referenced or discussed in the comment</li></ul>See Event/Entity Relations for details.
occurred_at | ISO Date | Occurred_at should always be set with server time or left blank to have it set by Activity Stream up on reception..
aspects | Map<S,M> | Aspects are commonly used information snippets which have rich support in Activity Stream both for processing and representation. Each event message can have multiple aspects. </br>Supported aspects: GeoLocation, Classification, Gamification*, Attachments, Locale *Gamification settings are always associated with the one commenting
acl | List<AC> | A list of entities which can see this comment (Access Control List) * If no rule is set then the event is accessible to all users </br>READ is the only option here and the writer (COMMENTS) is the only one with WRITE access by default. Anyone with WRITE access on the target entity (COMMENTED_ON) can remove/hide the comment by altering the ACL rules (nothing is ever permanently removed)

### API
### REST
### Message QUEUE


## Bumps
```javascript
//Simple bump message:
{
  "entities":[
    {"ACTOR":"Employee/lindarut"},
    {"BUMP_UP":"Vehicle:Car/VF058"}
  ]
}

//Bump up an event in the activity stream by stream id:
{
  "entities": [
    {"ACTOR":"User/stebax@gmail.com"},
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}

//Multiple bumps in one message:
{
  "entities": [
    {"ACTOR":"Employee/stefanb"},
    {"BUMP_NEUTRAL":"Customer/311068"},
    {"BUMP_DOWN":"Vehicle:Car/VF058"},
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}
```
Bump(s) are essentially the same thing a “like” and a “+1”. It’s a simple way for users to express their opinions regarding stream items (event, entities and comments).

Every bump is a link between exactly two entities, the user-entity responsible for voting/bumping and the stream-item being voted on.

Property | Type | Description
-------- | ---- | -----------
actor | Stream Item | Either an <entity_type>/<entity_id> pair or a stream_id.  Examples: Employee/stefanb  a2def97d-f2b0-3dc8-be51-f2a54a1879c3
action:entity | Stream Item | <bump_type>:<entity_type>/<entity_id> <bump_type>:<stream_id>   Action: BUMP_UP BUMP_DOWN BUMP_NEUTRAL
