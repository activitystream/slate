# Ticketing

##Ticket Presented
as.ticketing.ticket.presented
Sent when a ticket is presented by the ticketholder

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.ticketing.ticket.presented**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The ticketholder presenting the ticket
 | INVOLVES | The ticket being presented
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
properties | Map | Any other custom  properties to store with the ticket 