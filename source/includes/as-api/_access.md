# API & Access Control
## User
## API Keys
## Add API Key
## Scoped API Keys
Scoped API keys is an access token that can be generated using the master/management API keys as authentication in web applications.

Scoped keys are short lived and created for specific use. A session bound key can, for example, be created that includes information about the current user, roles, access etc. 

If defaults values are provided, when registering the key, they will be added to all subsequent messages submitted with that key along with user information.

If user information is not available when adding the key it can be added at later stage by tying together the server session and the correct user in submitted events/messages.

**Please note:** To make sure that the management API key is not compromised the scoped API keys should always be created on the server-side over a secure connection and the then passed on to the browser.

## Access Control
