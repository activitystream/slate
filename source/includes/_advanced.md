# Advanced Topics
## Scoped API Keys
## Message defaults using Token
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

```json
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

```json
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

