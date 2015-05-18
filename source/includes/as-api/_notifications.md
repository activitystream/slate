# Notifications
Documentation is not available at this time.

## Notification Types:
###MENTIONS
Someone mentions you in a comment

- Stream item comment: "{entity-label} mentioned you in a comment regarding {stream-item-label}"
- Entity comment: "{entity-label} mentioned you in a comment regarding {entity-label}" 

###ADDITION
Someone adds something to an item that you are following 

- Comment: "{entity-label} comments on a conversation you are following" 
- Entity: "{entity-label} added <item> to <target-entity-label>"

###CORRESPONDENCE 
Email/Messaging (TO/CC/BCC) - A message is received that includes you as a recipient

- "You have a new message from {from-entity-label}: '{subject...}'"

###NOTIFICATION
A Notification is created for you because of a event subscription you created

 - "{subscription-label} notification regarding {stream-item-label}" 
 
###FOLLOWS
Someone follows you or an entity that you create or manage

 - "{actor-entity-label} is now following {entity-label}"
 
###PUMP
Someone bumps you or an entity you created or manage
 
 - "{actor-entity-label} liked|disliked|... {entity-label}"

##Target Item
The notification includes the target item and the entities involved so that the notification message can be formatted.
The target item is one of the following types:
###Comment
###Observation
###Stream Item (Event)
###Entity
