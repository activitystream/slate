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

## Channel Monitor API
Handles what the channel monitors (follows)

###List monitors
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/monitors`

###Add monitor
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/monitors`

###Delete monitor
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/monitors/{monitor_id}`

## Channel Users API
Handles channel membership

###List members
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/members`

###Join a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/members`

###Leave a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/members`

###Set channels favorite status
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/favorite`

`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/favorite`

## Channel Stream API
The Stream for the Channel

`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/activity-stream`

Property | Description
-------- | -----------
{channel} | The label of the channel 

**Att.** *These actions are always performed as current user