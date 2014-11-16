# Bumps, Likes and Votes
Bump(s) are essentially the same thing a “like” and a “+1”. It’s a simple way for users to express their opinions regarding stream items (event, entities and comments).

Every bump is a link between exactly two entities, the user-entity responsible for voting/bumping and the stream-item being voted on. 

## Bump-Message Properties
```shell
Simple bump example:
{
  "relations":[
    {"ACTOR":"Employee/lindarut"},
    {"BUMP_UP":"Vehicle:Car/VF058"}
  ]
}

Bump up an event in the stream by stream id:
{
  "relations": [ 
    {"ACTOR":"Employee/stefanb"}, 
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}

Multiple bumps in one message:
{
  "relations": [ 
    {"ACTOR":"Employee/stefanb"}, 
    {"BUMP_DOWN":"Vehicle:Car/VF058"},
    {"BUMP_UP":"206fd910-d2f3-3a08-bca6-fe7088360a78"}
  ]
}
```

Property | Type | Description
-------- | ---- | -----------
actor | Entity | Either an <entity_type>/<entity_id> pair or a stream_id.  Examples: Employee/stefanb a2def97d-f2b0-3dc8-be51-f2a54a1879c3 
action:entity | Stream Item | <bump_type>:<entity_type>/<entity_id> or <bump_type>:<stream_id> Action: BUMP_UP BUMP_DOWN  BUMP_NEUTRAL Examples: "BUMP_UP":"Vehicle/VF058" "BUMP_DOWN":"Vehicle/RT050"

**Valid aspects:** None

## Post a Bump
## Send Bump via Message Queue
## Bump Queries

