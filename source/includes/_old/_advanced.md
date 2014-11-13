# Advanced Topics
## Scoped API Keys
Scoped API keys is an access token that can be generated using the master/management API keys as authentication in web applications.

Scoped keys are short lived and created for specific use. A session bound key can, for example, be created that includes information about the current user, roles, access etc. 

If defaults values are provided, when registering the key, they will be added to all subsequent messages submitted with that key along with user information.

If user information is not available when adding the key it can be added at later stage by tying together the server session and the correct user in submitted events/messages.

Please note: 
To make sure that the management API key is not compromised the scoped API keys should always be created on the server-side over a secure connection and the then passed on to the browser.

Implementation methods
Store it in the server session and then make it available on every page 
If no server-sessions are available then (either of the two options):
Store the scoped API key in a client/browser cookie and add it to the js-client from there
Create it once and set “req_cookie” to true*
*Currently this method is suboptimal and should be used as such

Scoped API keys are only added and never updated or deleted but they can be expired at any time.
## Message defaults using Token
```javascript
//STEP 1 - Setup (Store a default message for a specific token):
{
  "token":"bkg", //Token is generated if left blank
  "relations": [
    {"REFERENCES": "Promoter/hw_jimmy_buffet"},
    {"REFERENCES": "Artist/734667"}
  ],
  "aspects": {
    "classification": {
      "primary_market": "us",
    }
    "presentation":{
      "label":"Jimmy Buffett",
      "thumbnail":"http://media.ticketmaster.com/en-us/dbimages/165162a.jpg"
    }
  },
  "variables": {
    "baseurl":"http://www.ticketmaster.com/some/path",
    "mobileurl":"http://m.ticketmaster.com/another/path"
  }  //only referenced variables are used in the composite
}

//STEP 2 - User (Send a simple message that specifies a token)
{
  "token": "bkg", //reference the token to be used
  "type": "as.web.redirect",
  "origin": "com.web.server1",
  "relations": [
    {"ACTOR": "Cookie/eac98d34-0fbf-4c44-a4fa-bb092b6b18ce", "PROXY_FOR":"MobilituUnique/<MUniqueId>"}
  ],
  "aspects": {
    "pageview": {
      "path": "%baseurl%" //fetches the baseurl value from variables
    },
    "client_device": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.122 Safari/537.36",
    "client_ip": "127.0.0.1"
  }
}


//The composite message stored and processed:
{
  "type": "as.web.redirect",
  "origin": "com.web.server1",
  "relations": [
    {"ACTOR": "Cookie/eac98d34-0fbf-4c44-a4fa-bb092b6b18ce", "PROXY_FOR":"MobilituUnique/<MUniqueId>"},
    {"INVOLVES": "ShortUrl/bkg"},
    {"REFERENCES": "Promoter/hw_jimmy_buffet"},
    {"REFERENCES": "Artist/734667"}
  ],
  "variables": {
    "baseurl":"http://www.ticketmaster.com/some/path",
    "mobileurl":"http://m.ticketmaster.com/another/path"
  }
  "aspects": {
    "pageview": {
      "path": "http://www.ticketmaster.com/some/path"
    },
    "classification": {
      "primary_market": "us",
    }
    "presentation":{
      "label":"Jimmy Buffett",
      "client_device": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.122 Safari/537.36",
      "client_ip": "127.0.0.1"
      "thumbnail":"http://media.ticketmaster.com/en-us/dbimages/165162a.jpg"
    }
  },
  "token":"bkg"
}

```
A token can be created with "default event information" to be used as defaults for subsequent events. Every subsequent event message, specifying the token, will be merged with the defaults previously stored for that token.

An outgoing email may, for example, may contain a token in it’s subject line which include classification information for the email etc. and all later emails inbound or outbound can then be classified in the same way automatically.

Activity Stream also looks for an embedded tracker token in main text fields of the event message and if found the token is used to populate it with default values from the registered token defaults. 

Embedded tokens are formatted like this #token# where the length of the generated token is kept to a minimum without sacrificing security.

Tokens based defaults are ideal to bridge disjoint messages, like in the email example before, but they are not ideal to affect all the messages of a session unless the default values are well crafted and suit for all messages that reference the token.


Property | Type | Description
-------- | ---- | -----------
token | String | If an external system specifies the token then this property is used. If no external token is supplied then a default token is returned.
defaults_values | Map | This can be any* JSON structure which is a valid part of the messages that will use the tracker token returned.</br> *Defaults can not contain event specific information like occurred_at, origin or type. The defaults map can include a variables section and the values provided there can be added to subsequent messages with references to the variable name.
variables | Map | Values are added to subsequent messages when it a) reference the token and b) contains the variable name enclosed in %%. (%variable_name%)
valid_until | ISO Date | ISO datetime value with both milliseconds and time zone representing the exact time that the tracker token expires.

## Relations Types
## Sub-classing Relationship Types
## Sub-classing Entity Types
## Event Type Library
Each event-message submitted to the activity stream is of a particular type. “as.auth.login” is an example of a event-type-key used when reporting that a customer or an employee logs on to a website/system.

You can easily use your own event-types as they are created automatically on first use and service and processing active for that new event-type can be configured in the AS Admin if the defaults do not suffice.

Activity Stream is building a library of common event-types that will provide you with a) scaffolding/blueprints for integration and b) access to pre-built analysis and advanced processing.

An example of this is the simple “as.authentication.login” event-type. If that is used, with the associated event-types as *.login.failed, then the system will automatically identify problems, or any abnormalities in the login behavior for users.

In other words; using event-types from the AS Event-Type Library does not only help you to plan and categorize your business-events but it opens the door to pre-built analysis, reporting and features that would normally take a considerable amount of time when created on per-organization basis.
 
## Append Only 
The Historical Event Store in Activity Stream is append-only. This means that any reported business-event is permanently on-record and that it can not be changed, not ever.

This is a by-design security feature that plays a significant role in auditing and many other scenarios where data integrity must be above questioning.  Events in the log can hidden from view using an  Access Control List discussed below.

Business-entities, contrary to business-events, can be changed at will as well as the relationships between them.

## Access Control
Every business-event and every business-entity has a ACL (Access Control List) which details who has access to the information. An empty ACL means that it open but once a single entry is on that list the item is only available to those applicable. The ACL can contain individual users, roles or groups

## Deterministic UUIDs 


## Caveats
The first thing you will that notice when you start working with Activity Stream is that we use a semi-structured message format. This is different from most event-driven-analytics approaches currently available but we have solid reasons for doing it this way and we hope that you will learn to appreciate them no later than when you start reaping the benefits.

Please get familiar with the following concepts so we can make this ride as smooth as possible.

###Message Structure
Both business-events and business-entities can be stored using almost solely custom properties but we discourage that use of Activity Stream and think there are so many great tools available for such use-cases.

Our promise is simple: If you structure common element of your data according to AS convention then we will service it better than anyone. 

This does not limit you in storing any custom/proprietary data it merely means storing commonly used data according to a common convention. This allows us to create a wealth of re-usable processing and presentation featured that you can tap into at will.

### Message Aspects
Aspects provide a convention to store commonly used information like Presentation information, GeoLocation, AB Test results and much more.

Think of aspects like feature-flips that, when used, allow you to request customized service from the Activity Stream platform for your business-events or business-entities.

A simple example of this is the data enrichment automatically triggered when the ClientIP aspect is used. In that case AS fetches all relevant information known about that IP address and includes it in the message and all/any subsequent processing of the message.

The Aspects are a key component in providing a rich, but ever growing, set of features/services to our customers without 

### Relations
The relationships between an event and a entity, or between entities, can be typed and have properties. This means, for example, that the relationship from an event to a entity can declare what role the entity played in the event. 

Activity Stream comes with a range of built in relationship-types (Roles) used to describe even complex relations but new sub-types can be declared on the fly when needed.  

### Free-Format Data as Properties
Any JSON structure can be stored as properties and there it a first class citizen in terms of queries and other processing.

Additional, bulk-data, can be stored under payload where it’s compressed and only handed over lazily without any processing.

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import 'kittn'

api = Kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace `meowmeowmeow` with your personal API key.
</aside>


```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import 'kittn'

api = Kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```javascript
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Isis",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

`GET http://example.com/kittens`

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import 'kittn'

api = Kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/3"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```javascript
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">If you're not using an administrator API key, note that some kittens will return 403 Forbidden if they are hidden for admins only.</aside>

`GET http://example.com/kittens/<ID>`

Parameter | Description
--------- | -----------
ID | The ID of the cat to retrieve
