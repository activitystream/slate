# Support Tickets
Activity stream tracks and services support tickets in various ways.
The following samples are based on Zendesk tickets but they can be implemented for any ticketing system using Activity Stream [event messages](/as-api.html#introduction-to-events).

##Ticket New
```shell
{
    "type":"as.support.ticket.new",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/some@customer.com", "RELAYED_BY":"Email/employee@company.com"},*
        {"AFFECTS:CREATES":"Ticket/6"},
        {"AFFECTS:ASSIGNED_TO":"Email/employee@company.com"}
    ],
    "aspects":{
        "dimensions":{
            "ticket_type":"Ticket",
            "ticket_status":"Pending",
            "ticket_group": "Support",
            "ticket_via": "Web Form"
        },
        "summary":{
            "title":"do we have org fields now?",
            "content":"----------------------------------------------\n\nPetar, Jun 4, 17:24\n\nasfasfasfd"
        },
        "timed":{
            "ends":"<ISO Date>",
            "type":"Due"
        }
    },
    "importance":1,
    "properties":{
        "priority": '',
        "score":72,
        "ticket_url": "https://devactivitystream.zendesk.com/agent/tickets/6",
        "in_business_hours": "true"
    }
}
* Use RELAYED_BY if the action was relayed by an intermediary (employee on behalf of a customer) 
** Add a "AKA:SupportTicket" section if internal ticket number is in use
```
Sent when a ticket is created
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | **CREATED** | The Ticket created as a result of this action
 | ASSIGNED_TO | The entity that the ticket was assigned to (if set)
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
 | [summary](/as-api.html#summary) | Added to contain main ticket content 
 | [timed](/as-api.html#timed) | The due date set as ends 
importance | Integer | The importance for the ticket (Ranging from 0 - 5)
properties | Map | Any other custom  properties to store with the ticket 

##Ticket Assigned
```shell
{
    "type":"as.support.ticket.assigned",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS":"Ticket/6"},
        {"AFFECTS:ASSIGNED_TO":"Email/other.employee@company.com"}
    ]
}
```
Sent when a ticket is assigned to a new group or a new individual.
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.assigned**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | **AFFECTS** | The Ticket being re-assigned
 | **ASSIGNED_TO** | The entity that the ticket was assigned to (if set)


##Ticket Promoted
```shell
{
    "type":"as.support.ticket.promoted",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    "properties":{
        "priority": 'High',
    },
    "importance":3
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when a ticket is promoted (Made more important)
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
properties | Map | Any other custom  properties to store with the ticket 
importance | Integer | The importance for the ticket (Ranging from 0 - 5)


##Ticket Demoted
```shell
{
    "type":"as.support.ticket.demoted",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    "properties":{
        "priority": 'Normal',
    },
    "importance":2
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when a ticket is demoted (Made less important)
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
properties | Map | Any other custom  properties to store with the ticket 
importance | Integer | The importance for the ticket (Ranging from 0 - 5)

##Tickket Solved
```shell  
{
    "type":"as.support.ticket.solved",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_status":"Solved",
        }
    }    
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when a ticket is marked as solved
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  

##Ticket Closed
```shell
{
    "type":"as.support.ticket.closed",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_status":"Closed",
        }
    }    
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when a ticket is closed
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
 

##Ticket Re-Opened
```shell
{
    "type":"as.support.ticket.re-opened",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_status":"Open|Pending",
        }
    }    
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when a ticket is re-opened
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  

##Ticket Updated
```shell
{
    "type":"as.support.ticket.updated",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    ...
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when ticket other information is updated
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding

##Ticket Rated
```shell
{
    "type":"as.support.ticket.rated",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS:UPDATES":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_rating":3,
            "ticket_group": "Support",
            "ticket_type":"Ticket"
            "ticket_duration":<minutes>,
            "ticket_comments":<comment_count>,
            "ticket_assignments":<assignment_count>,
            "ticket_via": "Web Form"
        }
    },
    ...
}
* "UPDATES" can be used instead of the full qualifier "AFFECTS:UPDATES"
```
Sent when the ticket resolution/support is rated
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  

##Comment Added
```shell
{
    "type":"as.support.ticket.comment.new",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/employee@company.com"},
        {"AFFECTS":"Ticket/6"}
    ],
    "aspects":{
        "messaging": {
          "subject":"Some title",
          "from":"Email/employee@company.com",
          "to":[
            {"Email/some@custoemr.com"},
            {"Email/some.other@customer.com"}
          ],
          "url": "%some-url-pointing-to-a-original-copy-of-the-email$"
        },
        ...
    }
}
```
Sent when a comment is added to the ticket

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.support.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[relations](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html##messaging-email) | The comment (message) information  
