# Service Tickets & Issues
Activity stream tracks and services tickets and issues in various ways.
The following samples are based on Zendesk tickets but they can be implemented for any ticketing system using Activity Stream [event messages](/as-api.html#introduction-to-events).

##Ticket New
```shell
{
    "type":"as.pm.ticket.new",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/some@customer.com", "RELAYED_BY":"Email/employee@company.com"},*
        {"role":"AFFECTS", "entity_ref":"Ticket/6"},
        {"role":"AFFECTS:ASSIGNED_TO", "entity_ref":"Email/employee@company.com"}
    ],
    "aspects":{
        "dimensions":{
            "ticket_type":"Support Ticket",
            "ticket_status":"Pending",
            "ticket_group": "Support",
            "ticket_via": "Web Form",
            "ticket_locked": false,
            "ticket_priority": "high"
        },
        "presentation":{
            "label": "Ticket 6, do we have org fields now?",
            "description":"----------------------------------------------\n\nPetar, Jun 4, 17:24\n\nasfasfasfd",
            "details_url":"https://devactivitystream.zendesk.com/agent/tickets/6"
        },
        "timed":{
            "ends":"<ISO Date>",
            "type":"due"
        }
    },
    "importance":3,
    "properties":{
        "score":72,
        "in_business_hours": "true"
    }
}
```
```utf-8
* Use RELAYED_BY if the action was relayed by an intermediary (employee on behalf of a customer) Note: Should perhaps be represented as an independent entity/role in an event
** Add a "AKA:SupportTicket" section if internal ticket number is in use
```
Sent when a ticket is created
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | **CREATED** | The Ticket created as a result of this action
 | ASSIGNED_TO | The entity that the ticket was assigned to (if set)
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
 | [presentation](/as-api.html#presentation) | Presentation and content information 
 | [timed](/as-api.html#timed) | The due date set as ends 
importance | Integer | The importance for the ticket (Ranging from 0 - 5)
properties | Map | Any other custom  properties to store with the ticket 

##Ticket Assigned
```shell
{
    "type":"as.pm.ticket.assigned",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"},
        {"role":"AFFECTS:ASSIGNED_TO", "entity_ref":"Email/other.employee@company.com"}
    ]
}
```
Sent when a ticket is assigned to a new group or a new individual.
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.assigned**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | **AFFECTS** | The Ticket being re-assigned
 | **ASSIGNED_TO** | The entity that the ticket was assigned to (if set)


##Ticket Promoted
```shell
{
    "type":"as.pm.ticket.promoted",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "priority": "High",
        }
    },
    "importance":3
}
```
Sent when a ticket is promoted (Made more important)
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.promoted**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
properties | Map | Any other custom  properties to store with the ticket 
importance | Integer | The importance for the ticket (Ranging from 0 - 5)


##Ticket Demoted
```shell
{
    "type":"as.pm.ticket.demoted",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "priority": "Normal",
        }
    }
    "importance":2
}
```
Sent when a ticket is demoted (Made less important)
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.demoted**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
properties | Map | Any other custom  properties to store with the ticket 
importance | Integer | The importance for the ticket (Ranging from 0 - 5)

##Ticket Solved
```shell  
{
    "type":"as.pm.ticket.solved",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_status":"Solved",
        }
    }    
}
```
Sent when a ticket is marked as solved
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.solved**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  

##Ticket Closed
```shell
{
    "type":"as.pm.ticket.closed",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_status":"Closed",
        }
    }    
}
```
Sent when a ticket is closed
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.closed**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
 

##Ticket Re-Opened
```shell
{
    "type":"as.pm.ticket.reopened",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_status":"Open|Pending",
        }
    }    
}
```
Sent when a ticket is re-opened
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.reopened**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  

##Ticket Updated
```shell
{
    "type":"as.pm.ticket.updated",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ]
    ...
}
```
Sent when other ticket information is updated
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.updated**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding

##Ticket Rated
```shell
{
    "type":"as.pm.ticket.rated",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}*
    ],
    "aspects":{
        "dimensions":{
            "ticket_rating":"3",
            "ticket_group": "Support",
            "ticket_type":"Ticket"
            "ticket_duration":<minutes>,
            "ticket_comments":<comment_count>,
            "ticket_assignments":<assignment_count>,
            "ticket_via": "Web Form"
        },
        "timed":{
            "duration":<milliseconds>,
            "type":"total_duration"
        }
    }
    ...
}                                                       
```
Sent when the ticket resolution/support is rated
###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.pm.ticket.rated**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  

##Comment Added
```shell
{
    "type":"as.pm.ticket.comment.new",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "involves":[
        {"role":"ACTOR", "entity_ref":"Email/employee@company.com"},
        {"role":"AFFECTS", "entity_ref":"Ticket/6"}
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
**type** | Fixed | **as.pm.ticket.comment.new**
**origin** | String | Set to the identifier of the originating system (Here that is Zendesk)
**occurred_at** | ISO-Date | The date+time that the ticket was created 
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role they played
 | **ACTOR** | The entity responsible for creating the ticket
 | AFFECTS | The ticket (entity) that the comment is regarding
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html##messaging-email) | The comment (message) information  
