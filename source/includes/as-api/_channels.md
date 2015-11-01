# Channels
##Introduction Channels in AS
Channels allow users or a group of users to collaborate on as events across multiple entities (horizontal).
Each channel monitors specific entities, event types, sources or uses custom filters to dictate what event show up in the channel.

**Att.** Currently all channels are open but this will be changed in the next version of the API

## Channel API 
Handles channel provisioning

###Get list of available channels
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels`

###Get list of user channels
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/subscriptions`

###Create a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels`

###Change a channel
`PUT` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}`

###Delete a channel
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}`

## Channel Monitoring API
Handles what the channel follows (monitors)

###Channel Follows API
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/following`

###Add monitor
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/following`

###Add monitor
`PUT` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/following/{type}/{id}`

###Delete monitor
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/following/{type}/{id}`

## Channel Members API
Handles channel membership (The users following the channel)

###List members
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/followers`

###Join a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/followers`

###Leave a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/followers`

## Channel Stream API
The Stream for the Channel

`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/activity-stream`

Property | Description
-------- | -----------
{channel} | The label of the channel 

Subscription Attributes (Follows)
Property | Description
-------- | -----------
min_importance | The importance that stream items must have to be included in the subsription
event_types | List of event types that are included as a part of the subscription (null includes all event types)
tags | List of tags that the event must have (at least one) to be included in the subscription (null includes all stream items regardless of tags)
starred | Should the item be starred (favorite)
filter | A Map containing additional filter information

**Att.** *These actions are always performed as current user