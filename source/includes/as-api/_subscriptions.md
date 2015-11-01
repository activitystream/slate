# Subscription
##Introduction Subscription in AS

## Follow API

###Get list of available channels
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/following`

###Get list of user channels
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/subscriptions`

Subscription Attributes (Follows)
Property | Description
-------- | -----------
min_importance | The importance that stream items must have to be included in the subsription
event_types | List of event types that are included as a part of the subscription (null includes all event types)
tags | List of tags that the event must have (at least one) to be included in the subscription (null includes all stream items regardless of tags)
starred | Should the item be starred (favorite)
filter | A Map containing additional filter information

**Att.** *These actions are always performed as current user