# CRM Messaging

##Email Sent
as.crm.message.email.sent

Sent when an email is sent to a customer. This event covers marketing, support, newsletters and any other type of email sent from the company to the customer.

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.sent**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR:SENDER** | The entity (sender) that sends the message
 | **INVOLVES:RECEIVER** | The entity (customer) that receives the message
 | **CREATES** | The message that was sent
 | **CONCERNS** | The entity which caused this email to be sent (e.g. support ticket, marketing campaign)
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [classification](/as-api.html#classification) | Classification of the message (marketing, support etc.)
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket



##Email Bounced
as.crm.message.email.bounced

Sent when an email bounces in delivery, indicating an invald email address or mail server issues on the customers end.

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.bounced**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The customer to whom the message was sent
 | **CONCERNS** | The message that bounced
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket


##Email Opened
as.crm.message.email.opened

Sent when an email (that was sent by the company) is opened by the customer

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.opened**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The customer who opened the message
 | **CONCERNS** | The message that opened by the customer
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket



##Email Clicked
as.crm.message.email.clicked

Sent when an email (that was sent by the company) is clicked by the user

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.clicked**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The customer who clicked the message
 | **CONCERNS** | The message that the customer clicked
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom properties to store with the ticket


##Email Subscribed
as.crm.message.email.subscribed

Sent when the customer subscribes to a message type

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.subscribed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The customer who subscribed
 | **CONCERNS** | The message series or group to which the customer subscribed
 [aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket


##Email Unsubscribed
as.crm.message.email.unsubscribed

Sent when the customer unsubscribes from a message type

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.unsubscribed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **ACTOR** | The customer who unsubscribed
 | **CONCERNS** | The message series or group from which the customer unsubscribed
 [aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket

