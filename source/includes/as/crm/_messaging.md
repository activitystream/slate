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
 | **INVOLVES** | The message that bounced
 | **CONCERNS** | The customer to whom the message was sent
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
 | **INVOLVES** | The message that opened by the customer
 | **CONCERNS** | The customer who opened the message
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
**type** | Fixed | **as.crm.message.email.opened**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **INVOLVES** | The message that the customer clicked
 | **CONCERNS** | The customer who clicked the message
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket


##Email Unsubscribed
as.crm.message.email.unsubscribe

Sent when the customer unsubscribes from a message type

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.crm.message.email.opened**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | **INVOLVES** | The message from which the customer unsubscribed
 | **CONCERNS** | The customer who unsubscribed
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [messaging](/as-api.html#messaging-email) | Email specific information
 | [presentation](/as-api.html#presentation) | Presentation and content information
 | [dimensions](/as-api.html#classification) | Additional information added for analytics processing
properties | Map | Any other custom  properties to store with the ticket

