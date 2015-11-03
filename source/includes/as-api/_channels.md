# Channels
##Introduction Channels in AS
Channels allow users or a group of users to collaborate on as events across multiple entities (horizontal).
Each channel monitors specific entities, event types, sources or uses custom filters to dictate what event show up in the channel.

**Att.** Currently all channels are open but this will be changed in the next version of the API

## Channel API 
Handles channel provisioning

```shell
POST this to create a new channel:
{
  "entity_id":"fraud",
  "aspects":{
    "presentation":{
      "label":"The Fraud Channel"
    }
  },
  "properties": {
    "menu_label":"Fraud"
  }
}

and get this back:

{
    "entity_ref": "ASChannel/fraud",
    "aspects":
    {
        "presentation":
        {
            "label": "The Fraud Channel"
        }
    },
    "properties":
    {
        "menu_label": "Fraud"
    },
    "_class": "ASChannel"
}
```

###Get list of available channels
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels`

###Create a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels`

###Change a channel
`PUT` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}`

###Delete a channel
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}`

###Channel Attributes

Property | Description
-------- | -----------
{channel} | The label of the channel 
entity_id | The unique and unchangeable label/id for the channel
entity_ref | The unique and unchangeable reference key for the channel
aspects | Presentation is set via the presentation aspect 
properties | Any additional properties 
\_stream\_id | The Stream ID for the channel that can be used to add comments 

## Channel Membership API
```shell
Post this to join a channel 
{
  "starred":true,
  "list_index": 1
}

and get this back:
{
  "starred": true,
  "list_index": 1,
  "occurred_at": "2015-11-02T07:37:28.512Z",
  "follower_ref": "ASUser/vpdev",
  "follows_ref": "ASChannel/sales",
  "_class": "FOLLOWS"
}

get /followers and receive this:
[
  {
    "occurred_at": "2015-11-02T07:37:28.512Z",
    "starred": true,
    "list_index": 1,
    "follows_ref": "ASChannel/sales",
    "follower_ref": "ASUser/vpdev",
    "_class": "FOLLOWS"
  }
]

```

Handles channel membership (The users following the channel)
All actions are performed in the name of the user that is logged in. 
"on behalf of" actions will be added later.

###List members
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/followers`

###Join a channel
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follow`

###Leave a channel
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follow`

###Subscription Attributes

Property | Description
-------- | -----------
{channel} | The label/id of the channel
starred | Should the item be starred (favorite)
list_index | Where should the item be in the list of things that are being followed

**Att.** *These actions are always performed as current user

## Channel Monitoring API
```shell
Send this to ../follows/EventDate/1-65409
{
  "min_importance":2
}

and get this back:

{
  "min_importance": 2,
  "occurred_at": "2015-11-02T07:55:24.240Z",
  "follower_ref": "ASChannel/sales",
  "follows_ref": "EventDate/1-65409",
  "_class": "FOLLOWS"
}

Get a list of what the channel follows ../wollowing and get this back.
[
  {
    "occurred_at": "2015-11-02T07:55:24.240Z",
    "min_importance": 2,
    "follows_ref": "EventDate/1-65409",
    "follower_ref": "ASChannel/sales",
    "_class": "FOLLOWS"
 }
]
```
Handles what the channel it self monitors (follows) 

###Channel Follows API
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follows`

###Add monitor
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follows`

###Add monitor
`PUT` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follows/{type}/{id}`
`POST` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follows/{type}/{id}`

###Delete monitor
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/follows/{type}/{id}`

###Subscription Attributes

Property | Description | Default
-------- | ----------- | -----------
{channel} | The label/id of the channel
min_importance | The importance that stream items must have to be included in the subsription
event_types | List of event types that are included as a part of the subscription (null includes all event types) *NOT WORKING*
roles | List of roles that the entity plays in the event *NOT WORKING*
degrees | Number of degrees viewed for the entity *NOT WORKING*
relations | List of relation types traversed over (degrees) for the entity *NOT WORKING*
tags | List of tags that the event must have (at least one) to be included in the subscription (null includes all stream items regardless of tags)
filter | A Map containing additional filter information
starred | Should the item be starred (favorite)

## Channel Stream API
The Stream for the Channel

### The latest activity stream entries
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/activity-stream`

### A brief of the latest activity stream entries
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/activity-stream/brief`

### A brief for the activity stream entries of a specified period
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/activity-stream/{period}/brief`

### A brief for the activity stream entries for a date range
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/channels/{channel}/activity-stream/{begin}/{end}/brief`

###Request attributes

Property | Description
-------- | -----------
{channel} | The label/id of the channel
{period} | ISO period calculate form now 
{begin} | ISO period starting point  
{end} | ISO period ending point 
