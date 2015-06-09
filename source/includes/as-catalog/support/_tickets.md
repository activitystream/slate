# Support Tickets
##Ticket New
```shell
{
    "type":"as.support.ticket.new",
    "origin":"zendesk",
    "occurred_at":"2015-06-04T17:24:13+01:00",
    "relations":[
        {"ACTOR":"Email/petar@activitystream.com"},
        {"AFFECTS:ASSIGNED_TO":"Email/petar@activitystream.com"},
        {"AFFECTS:CREATED":"Ticket/6"},
    ],
    "aspects":{
        "dimensions":{
            "ticket_type":"Ticket",
            "ticket_status":"Pending",
            "ticket_group": "Support"
            "ticket_via": "Web Form"
        },
        "resolvable":{
            "external_id":<external_id>
        }
        "summary":{
            "title":"do we have org fields now?",
            "content":"----------------------------------------------\n\nPetar, Jun 4, 17:24\n\nasfasfasfd"
        }
    },
    "properties":{
        "score":72,
        "ticket_url": "https://devactivitystream.zendesk.com/agent/tickets/6",
        "in_business_hours": "true"
    }
}
```
##Ticket Assigned
as.support.ticket.assigned
##Ticket Escalated
as.support.ticket.escalated
##Ticket De-Escalated
as.support.ticket.de-escalated
##Tickket Solved
as.support.ticket.solved
##Ticket Closed
as.support.ticket.closed
##Ticket Re-Opened
as.support.ticket.re-opened
##Ticket Updated
as.support.ticket.updated
##Comment added
as.support.ticket.comment.new
