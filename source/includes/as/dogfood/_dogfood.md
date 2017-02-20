# Dogfood

##OI Observation Liked
as.dogfood.oi.observation.liked

Sent when an OI observation is liked by a user.

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.dogfood.oi.observation.liked**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | User that liked the observation
 | INVOLVES | Observation that was liked
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
properties | Map | Any other custom  properties to store with the ticket 

##OI Observation Disliked
as.dogfood.oi.observation.disliked

Sent when an OI observation is disliked by a user.

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.dogfood.oi.observation.disliked**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | User that disliked the observation
 | INVOLVES | Observation that was disliked
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
properties | Map | Any other custom  properties to store with the ticket 

##OI Observation Confusing
as.dogfood.oi.observation.confused

Sent when an OI observation marked as confusing by a user.

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.dogfood.oi.observation.confused**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | User that was confused by the observation
 | INVOLVES | Observation that was marked as confusing
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
properties | Map | Any other custom  properties to store with the ticket 

##OI Observation Seen
as.dogfood.oi.observation.seen

Sent when an OI observation is seen by a user.

##OI Observation Expanded
as.dogfood.oi.observation.expanded

Sent when an OI observation is expanded by a user.

##OI Observation Status Changed
as.dogfood.oi.observation.workflow.status.changed

Sent when the workflow status of an OI observation is changed (e.g. open -> closed).

##OI Observation Assignment Changed
as.dogfood.oi.observation.workflow.assignment.changed

Sent when the assignment of an observation to an employee or department is changed.

##OI Observation Comment Created
as.dogfood.oi.observation.workflow.comment.created

Sent when a new comment on an observation is created.


