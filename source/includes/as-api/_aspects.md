#Aspects
Aspects are commonly used event and entity extensions which have rich support in Activity Stream in regards to processing and representation. The offer a normalized/structured way to store common information in a way that makes it possible for us to build rich functionality and ui that meet common needs without restricting customization.

## AB Testing
```shell
A partial purchase-message illustrating the use of the ab_testing aspect:
{
  "action": "as.ec.cart.purchased",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {"ACTOR":"Session/KJ982KJ2", "PROXY_FOR":"Customer/311068"},
    {"AFFECTS":"Cart/23498239"}
  ],
  "aspects": {
    "ab_test": {
      "id":"checkout_process",
      "variant":"no-captcha",
      "outcome":"sale",
      "metric":"7",
      "amount":"730",
      "properties":{"some":true}
    },
    "dimensions":{
      "theme":"blue"
    },
    "timed":{
      "duration":62323
    },
  }
}
```
The ab_test aspect is used to store AB Test results. Analytics for AB Tests is immediately available as well as real-time dashboards tailored for AB testing.

Field | Type | Description | Default
----- | ---- | ----------- | -------
**id** | String | The AB Test ID. Valid ids contain lowercase strings and “_” only. (much like a field-name in a database table)
**variant** | String | What variant of the test led to this event. Valid variant contain lowercase strings and "_" only.
outcome | String | What was the outcome of the test. Valid outcome contain lowercase strings and "_" only.
metric | Double | Additional/generic metric information for the test outcome
amount | Double | Additional/generic amount information for the test outcome
properties | JSON | Free format JSON structure with additional information.

**Applies to:** [`Events`](#introduction-to-events)</br>
**Enhanced by:** [`Dimensions*`](#dimensions-metricsfacts), [`Timed**`](#timed)

*\*Use the dimensions aspect to add dimensions to the AB_Test outcome.*</br>
*\*Use the timed aspect to report how lon the AB test took.*

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.
* See [Analytic queries](/analytics.html#ab-testing-analytics) for information on fetching ab-testing analytics.
* See [Streaming updates]() for information on how to subscribe to streaming ab-testing events.

## Attachments
```shell
A partial email-sent-message illustrating the use of the attachments aspect:
{
  "action": "as.crm.email.sent",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.003Z",
  "entities": [
    {"ACTOR":"User/311068"}
  ],
  "aspects": {
    "attachments": [
      {
        "url":"http://www.mbl.is/tncache/frimg/dimg_cache/e370x247/7/34/7343072.jpg",
        "description":"John and Suzie doing math",
        "size":3445,
        "properties":{"smu":"fleh"}
      }
    ]
  }
}
```
List of attachments associated with the event.

Field | Type | Description
----- | ---- | -----------
**url** | String | A URL pointing to the attached document (Binary storage available soon).
filename | String | An alternative filename for the file (Ignoring filename in URL).
description | String | Content description
width | Double | With in pixels if this is an image/video.
height | Double | Height in pixels if this is an image/video.
size | Double | File size in Bytes  (Used to warn of large content)
created | DateTime | ISO Date Time when the file was created (Used if missing from file information)
updated | DateTime | ISO Date Time when the file was updated (Used if missing from file information)
mime_type | String | Explicitly specifies the document type (Ignoring the file extensions).
properties | JSON | Free format JSON structure with custom information
content | Base64 | The file contents***

**Applies to:** [`Events`](#introduction-to-events)</br>
**Enhances:** [`Messaging`](#messaging-email)

*** Storing of file contents, as well as email contents, depends on your AS subscription

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.

## Classification
```shell
Entity snippet showing the Classification aspect
{
  "entity_ref": "Product/290209092",
  "aspects": {
    "classification": {
      "make":"Apple",
      "model":"iPhone",
      "flavor":"6+ Gold",
      "year": 2015
    }
  }
}
```
Used for product classify 

Field | Type | Description
----- | ---- | -----------
make | String | The make/brand of the product (BMW)
model | String | The model of the product (316)
flavor | String | The version/flavor of the product (i)
size | String | The size (if sized)
year | Integer | The year of production (2015)
categories | List\<String\> | The product categories

**Applies to:** `Entities`

## Client Device
```shell
A partial login-message illustrating the use of the client_device aspect:
{
  "action": "as.auth.login",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "PROXY_FOR":"Customer/311068"
    }
  ],
  "aspects": {
    "client_device": {
      "user_agent":"Mozilla/5.0 ..."
    }
  }
}

Same partial message showing the use of the client_device shorthand:
{
  "action": "as.auth.login",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "PROXY_FOR":"Customer/311068"
    }
  ],
  "aspects": {
    "client_device": "Mozilla/5.0 ..."
  }
}
```
Based on user_agent string and is only used for web/browser originated events.


Field | Type | Description
----- | ---- | -----------
user_agent | String | The user agent (browser) used by the ACTOR when causing the parent event to be produced
track_for* | String | Common or long-lived information, like this, may be moved to the ACTOR entity if it applies to all events from the actor.</br>In web context then this is used to apply certain redundant information to the Session entity. There it would be stored only once per session or a few time if it changes during the section. Multiple entries are stored for slow changing aspects to keep complete auditing log.
 | |  **Following are read-only properties**
*\_device_vendor* | String |
*\_device_type* | String |
*\_device_pname* | String |
*\_brower_vendor* | String |
*\_browser_type* | String |
*\_browser_version* | String |
*\_os_type* | String |
*\_os_version* | String |
*\_is_input_device* | Boolean |
*\_is_tablet* | Boolean |
*\_is_wireless* | Boolean |
*\_display_width* | Integer
*\_display_height* |Integer

**Applies to:** `Events`

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.


## Client IP
```shell
A partial login-message illustrating the use of the client_ip aspect:
{
  "action": "as.auth.login",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "PROXY_FOR":"Customer/311068"
    }
  ],
  "aspects": {
    "client_ip": {
      "ip":"190.236.141.125"
     }
  }
}

Same partial message showing the use of the client_ip shorthand:
{
  "action": "as.auth.login",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "PROXY_FOR":"Customer/311068"
    }
  ],
  "aspects": {
    "client_ip": "190.236.141.125"
  }
}

```
If the event is originated over public Internet and the IP address is provided then Activity Stream supplies the specifics that can be resolved from the IP address.

Field | Type | Description
----- | ---- | -----------
ip | IP Address | The IP address used by the ACTOR when causing the parent to be produced
track_for* | String | Common or long-lived information, like this, may be moved to the ACTOR entity if it applies to all events from the actor.</br> In web context then this is used to apply certain redundant information to the Session entity. There it would be stored only once per session or a few time if it changes during the section. Multiple entries are stored for slow changing aspects to keep complete auditing log.
 | |  **Following are read-only properties**
*\_isp* | String | Name of the ISP if it could be resolved for the IP
*\_organization* | String | Name of the Organization the IP if it could be resolved for the IP
*\_reverse_dns* | String | Reverse DNS Name for the IP if it could be resolved
*\_geolocation* | Map | GeoLocation entry if existed for the IP (See GeoLocation)
*\_locale* | Map | Locale entry if existed for the IP (See Locale)

* Needs updating

**Applies to:** [`Events`](#introduction-to-events)</br>

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.

## Customer Experience Index (CEI)
```shell
A partial password-changed-message illustrating the use of the cei aspect:
{
  "action": "as.auth.password.change",
  "source": "com.activitystream.www",
  "entities": [
    {"ACTOR":"Customer/311068"}
  ],
  "aspects": {
    "cei": {
      "engagement":1.5
    }
  }
}
```
Each event can have synthesized/imagined effect on the entities affected by it. When applicable it can, for example, be used to estimate the current state of a customer based on the things in his activity stream.

The defaults can be stored for each Event-Type but they can also be explicitly defined for individual events using this aspect.


Field | Type | Description
----- | ---- | -----------
engagement | Float | Is the target entity engaged</br>inactive <-> active (-5 … +5)
happiness | Float | Is the target entity experiencing good or bad things</br>frustrated <-> happy (-5 … +5)
care | Float | Is the target entity being attended to</br>neglected <-> pampered (-5 … +5)
rating | Float | customer rating liability <-> asset (-5 … +5)
intent | Float | Is the target entity doing good or bad things</br>evil <-> good (-5 … +5)
affects* | String[] | List of the entities that should be affected by this. (ACTOR/AFFECTS etc.)</br>\* ACTOR is the default target for profiling values.
duration | Long | For how long does this affect the target (days)

**Applies to:** [`Events`](#introduction-to-events), [`Entities`](#introduction-to-entities) (via Event-Types and Events), [`Event-Types`]()</br>

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.
* See [Analytic queries](/analytics.html#cei-analytics) for information on fetching CEI analytics.
* See [CEI calculations and analytics]() for more information on the Customer Experience Index.

## Demography
```shell
A incomplete entity-message showing use of the demography aspect:
{
  "entity_ref": "Customer/311068",
  "aspects": {
    "demography": [
      {
        "gender":"Male",
        "birth_year":1968,
        "marital_status":"Married",
        "education":"No diploma"
      }
    ]
  }
}
```

Field | Type | Suggested values (but you can surely use your own)
----- | ---- | -----------
gender | String | `Male`, `Female`, `Unknown`, `Trans Female`, `Trans Male`, `Trans Person`, `Gender Variant`, `Gender Questioning`, `Bigender`, `Androgynous`, `Pangender`, `Transsexual`.
birth_year | Integer | 19+ ... 2014
ethnicity | String | `White`, `Hispanic` / `Latino`, `Black` / `African American`, `Native American` / `American Indian`, `Asian` / `Pacific Islander`, `Multiracial`, `Other`
marital_status | String | `Single` (never married), `Married` or `In-Partnership`, `Widowed`, `Divorced`, `Separated`, `Other`
education | String | `No schooling`, `Nursery school`, `Primary school` (up to 11th grade), `No diploma` (12th grade), `High school` (graduate/GED), Some `College credit` (No degree), `Associate degree` (AA, AS), `Bachelor's degree` (BA, AB, BS), `Master's degree` (MA, MS, MEng, MEd, MSW, MBA), `Professional degree` (MD, DDS, DVM, LLB, JD), `Doctorate degree` (PhD, EdD)
family_size | String | 1 .. XX
employment | String | `Employed`, `Self-employed`, `Out of work and looking`, `Out of work not looking`, `A homemaker`, `A student`, `Military`, `Retired`, `Unable` to work, `Other`
disability | String |
income | String | XXX Range
housing | String | `Partially Owned`, `Fully Owned`, `Rent`, `Rent-Free`, **Other**
properties | JSON | Free format JSON structure with custom information

**Applies to:** [`Entities`](#introduction-to-entities)
**Enhanced with:** [`Locale*`](#locale)  [`Timed*`](#timed)

### Additional queries and interfaces
* See [Entities](#entities) for information on updating entities in AS.

## Dimensions (Metrics/Facts)
```shell
A incomplete login-message showing use of the dimensions aspect:
{
  "action": "as.auth.login",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {"ACTOR":"User/311068"}
  ],
  "aspects": {
    "dimensions": {
      "method":"facebook",
      "custom":true
    }
  }
}
```
All values in dimensions are added to all time-series that are created for the event.
In that way AB test results, page-views, purchases or any other aspect that automatically generated time-series do get extra dimensions for slicing and dicing.

Field | Type | Description
----- | ---- | -----------
key   | String | The key in the "{**key**}":{value} pair
value | Object | The value in the "{key}":{**value**} pair (Can be String a Numeric or a list of such values)

**Applies to:** [`Events`](#introduction-to-events), [`Time-Series Data`](), [`Event-Types`]()</br>
**Enhances:** [`TS Data`](#ts-data-data-points)

### Additional queries and interfaces
* See [Entities](#entities) for information on updating entities in AS.
* See [TS Data](#ts-data-data-points) for an example showing use with timeseries data.

## Entities
Generic entity information and entity lifecycle. Event sourcing 

Field | Type | Description
----- | ---- | -----------
action | String | CREATES, UPDATES, REMOVES, VERIFIES, REVIVES
entity | <entity_ref> | entity_ref = "Product/2989282"
aspects | <Aspects> | Entity Aspects
links | <Links> | Entity Links
properties | JSON | JSON containing customer specific information

**Applies to:** [`Events`](#introduction-to-events)</br>


## Grouped
```shell
A incomplete email-sent-message showing use of the grouped aspect:
{
  "action": "as.msg.email.sent",
  "source": "com.activitystream.www",
  "entities": [{"ACTOR":"Username/stefanb"}],
  "aspects": {
    "grouped": {
      "group":"Regarding the collapsed emails",
      "scope":"email"
    }
  }
}

Shorthand example:
{
  "action": "as.msg.email.received",
  "source": "com.activitystream.www",
  "involves": [{"ACTOR":"Username/stefanb"}],
  "aspects": {"grouped":"Regarding the grouped/collapsed emails"}
}
```
Events spanning a wide time range can be pulled together and collapsed into a group and placed in the stream according to the most recent event in the group. This behaviour is common in email programs where an email thread is grouped together and collapsed, showing only the latest email.

To achieve this the messages in the group must have the same group value. If the grouped events are of different actions then they also need to specify a scope. That way all the different email event messages can specify “email” as their collapse group and the main subject, without RE:/FWD: prefixes, as their value.

Field | Type | Description
----- | ---- | -----------
group | String | The common value used to group and collapse all found events of this same event type. (see type for grouping different event types together)
scope | String | To group events of multiple event-types into the same group then put a common scope here.

Make sure all messages meant to be collapsed together share the same group and scope settings.

Please note that “re:”, “fwd:” etc. are removed from the group string if found.

**Applies to:** [`Events`](#introduction-to-events)</br>

### Additional queries and interfaces
* See [Events](#events) for information on updating entities in AS.

## Items (xCommerce)
```shell
A fairly complete purchase message with composite product and currency information:
{
  "action": "as.xcommerce.purchase.completed",
  "source": "ticketsales.web",
  "entities": [{"ACTOR":"Session/311068"}],
  "aspects": {
    "items": [
      {
        "BOUGHT":["Event/3982928","Venue/3982928","Artis/3982928"],
        "variant":"VIP Pass",
        "item_count":3,
        "item_price":75
      },
      {
        "RENTED":"Event/3982928",
        "variant":"Parking",
        "item_count":1,
        "item_price":25,
        "valid_from":"<iso-date-time>",
        "valid_until":"<iso-date-time>"
      }
    ],
    "locale":{
      "currency":"USD"
    }
  }
}
```
Generic purchase information. Items in the list will get the appropriate relations to the ACTOR entity specified in the relations section.

Field | Type | Description
----- | ---- | -----------
\<type\> |\<entity\> | Line item information </br> \<type\>: PURCHASED, RENTED, LEASED, GOT, RETURNED, WON, CARTED, UN_CARTED, RESERVED, CANCELLED, UNAVAILABLE, PURCHASE_USED, PROCESSING_ONLY </br> \<entity\>: Entity reference(s) (can be a list for composite products)
variant | String | Product variant when/if applicable
item_count | Double | Number of items
item_price | Double | Price of individual item (Use the [localize](#locale) aspect to control currency)
serial_numbers | String[] | Serial numbers of purchased items (when/if available)
fee_fixed | Double | Fixed per-item cost, added on top of the item price </br>(item price + item fees - discount = total item price)
fee_percentage | Double | Variable per-item cost added on top of total price </br>(item price + item fees - discount = total item price)
discount_percentage | Double | Discount % to be subtracted from the total-item-price</br>(item price + item fees - discount = total item price)
tax_percentage | Double | Tax % to be added to the item price
total_in_stock | Double | How many items still in stock
total_for_sale | Double | How many items were (max) for sale
valid_from | DateFrom | Valid/Active from date 
valid_until | DateFrom | Valid/Active until date 
accounting_key | String | The accounting key to use for accounting based analytics  
description | String | Text description of the "line item" (summary)
dimensions | MAP | MAP containing additional dimensions for analytics
properties | JSON | JSON containing customer specific information
\_total | Double | N/A
\_fees | Double | N/A
\_tax | Double | N/A
\_discount | Double | N/A


**Applies to:** [`Events`](#introduction-to-events)</br>
**Enhanced by:** [`Locale`](#timed), [`transaction`](#transaction)

## Locale
```shell
{
  "action": "as.auth.failed",
  "source": "com.activitystream.www",
  "entities": [
    {"ACTOR":"Username/stefanb"}
  ],
  "aspects": {
    "locale": {
      "locale": "en-US",
      "currency": "USD",
      "timezone": "America/Phoenix"
    }
  }
}
```
Use the locale aspect if the content of the event message is or needs to be localized.  If used then all amounts, dates, times etc., for the associated event, will be reported using the provided locale.

Requesting an event with different locale then used when reporting the event will cause the content of the event to be converted*.

* Please note that automatic conversion of amounts relies on international currency index (see link) and may not conform with the currency valuation you use internally.

Field | Type | Description
----- | ---- | -----------
locale | String | Java locale addressing both language and country. Language: ISO 639 alpha-2/3 Location/country: ISO 3166 alpha-2/3 Sample language tag: en-GB
currency | String | 3 letter currency code (ISO 4217).  Sample currency code: “USD”
timezone | String | The time zone ID. (time zones in the tz database) Sample timezone ID: “America/Phoenix”

**Applies to:** [`Events`](#introduction-to-events) [`Entities`](#introduction-to-entities)</br>
**Enhances:** [`items`](##items-xcommerce) [`transaction`](#transaction) [`gelolocation`](#gelo-location)

## Location
```shell
A incomplete login-failed-message showing use of the location aspect:
{
  "action": "as.auth.failed",
  "source": "com.activitystream.www",
  "entities": [{"ACTOR":"Username/stefanb"}],
  "aspects": {
    "location": {
      "latlong":"64.135338,-21.895210",
      "track_for":"ACTOR"
    }
  }
}

A incomplete route-set-message showing use of the location aspect with multiple values:
{
  "action": "as.fleet.route.set",
  "source": "com.activitystream.www",
  "entities": [{"ACTOR":"Username/stefanb"}],
  "aspects": {
    "location": [
    {
      "latlong":"64.135338,-21.895210",
      "track_for":"ACTOR",
      "type":"from"
    },
    {
      "latlong":"-21.895210,64.135338",
      "track_for":"ACTOR",
      "type":"to"
    }
    ]
  }
}
```
If an event specifies a (geo) location then Activity Stream resolves it and provides additional information for it.

After enrichment* the aspect returns location specific information.

Field | Type | Description
----- | ---- | -----------
**latlong**| String | "double,double" with "latitude,longitude"
track_for* | String | Common or long-lived information like this may be associated with linked entities, especially if it applies to all events related to that entity (usually the actor). In web context then this is used to apply certain redundant information to the Session entity. There it would be stored only once per session or a few time if it changes during the session. Multiple entries are stored for slow changing aspects to keep complete location log.
type | String | Presentation/processing  tags: **from** (location), **to** (destination), **residence**, **work**, **temporary**
accuracy | Integer | A 0..10 rating for the accuracy of this location.  This is not the geolocation-accuracy (resolution) but how reliably the bound entity can be associated with that location. 10 means that it/he was positively there. 0 mean that it’s a vague guess.
 | |  **Following are read-only or resolved properties**
*\_street*|String|
*\_street_no*|String|
*\_postal_code*|String|
*\_city*|String|
*\_dma_code*|String|
*\_metro_code*|String|
*\_region*|String|
*\_region_code*|String|
*\_area*|String|
*\_area_code*|String|
*\_country*|String|
*\_country_code*|String|
*\_continent*|String|
*\_organization*|String|

**Applies to:** [`Events`](#introduction-to-events), [`Entities`](#introduction-to-entities)</br>
**Enhanced by:** [`Timed`](#timed), [`Locale`](#timed)

*It depends on subscription whether location is enriched or not and is always quantity based *

<!--
radius|Double | Area affected
coordinates|Double[] | List of double values [lat,long] / [double, double] representing a single point. Add more coordinate pairs to represent a line and make sure to close it with the initial coordinate when representing an area. The initial point is used as a reference in the latlong field.
-->

### Additional queries and interfaces
* See [Events](#events) for information on updating entities in AS.

## Messaging (Email)
```shell
A complete email-sent-message showing the use of the messaging aspect:
{
  "action": "as.msg.email.sent",
  "source": "com.activitystream.exchange",
  "entities": [
    {"ACTOR":"Username/stefanb"}
  ],
  "aspects": {
    "messaging": {
      "subject":"Some title #3983#", <- notice the tracking token
      "from":"Email/stefan@activitystream.com",
      "to":[
        {"Email/linda@activitystream.com", "belongs_to":"Customer/181271"},
        {"Email/stebax@gmail.com", "belongs_to":"Username/stefanb"}
      ],
      "dated": "2014-01-29T12:00:00.001Z",
      "url": "%some-url-pointing-to-a-server-copy-of-the-email$"
    },
    "attachments": [
      {
        "url":"car-proposal.doc",
      }
    ],
    "dimensions": {
      "action":"proposal",
    },
    "properties": {
      "some":true,
    },
    "payload": "<-base 64 email content->"
  }
}
```

Events that represent emails, or similar communications, can provide recipient and sender details in the Message aspect.

Field | Type | Description
----- | ---- | -----------
subject | String |
**from** | String | The event will be linked with the entities with the role set to "MESSAGE_FROM"
**to** | String[] | The event will be linked with all listed entities with the role set to "MESSAGE_TO"
cc | String[] | The event will be linked with all listed entities with the role set to "MESSAGE_CC"
bcc | String[] | The event will be linked with all listed entities with the role set to "MESSAGE_BCC"
url | String | A fully qualified URL pointing to the email on the email server.
properties |  for |  for containing additional, customer specific, information
group | Boolean | Add grouping/collapsing information for the event (default is true)
content | Base64 | The email contents***

**Enhance by:** [`Attachments`](), [`Locale`](), [`Dimensions`](#dimensions-metricsfacts), [`**Collapsable`](), [`Access Control`]()</br>

*All emails are created using the entity type Email.  Relations between email addresses and business entities (employees, customer, partners etc.) can be explicitly created using the Entity API.

** Messages are automatically treated like collapsable. It means that the subject is used to create a group of messages that can be collapsed to show only the latest message.

*** Email contents, as well as document contents, depends on AS subscription

This aspect has not been implemented

**Applies to:** [`Events`](#introduction-to-events)</br>

## Page View
```shell
A complete web-page-viewed-message showing the use of the messaging aspect:
{
  "action": "as.web.page.browse",
  "source": "com.activitystream.www",
  "entities": [
    {"ACTOR":"Session/32948429384239", "PROXY_FOR": "Customer/311068"}
  ],
  "aspects": {
    "pageview": {
      "path":"http://www.yoursite.com/cat/prod-cat/product",
      "path_properties":{
        "event":2928293
      },
      "referrer":"http://www.somesite.com/page/ad",
      "referrer_properties":{
        "campaign":2928293
      },
      "page_content": [
        {"FEATURED":"Event/2928293"},
        {"RELATED":"Artist/232222"},
        {"RELATED":"Venue/2424232"}
      ]
    },
    "dimensions": {
      "type":"Event Page"
    }
  }
}
```

The pageview aspect is handy when reporting web based events but they can also be read from access logs or reported from the browser using a simple as-tracking library.

**please note:** This, server based, event-message can contain details not available in the browser and does not require web-crawling to discover page content (Explicit vs. Implicit). Sending such events from the server side can be more accurate and is certainly more discrete.

Field | Type | Description
----- | ---- | -----------
**path** | String | A required path (last part of url or the whole URL if the source attribute is not used to specify that. (Mapped to a Page Entity). Please note: Everything after ? will be removed and added to path_properties.
path_properties | JSON | Custom request properties for the page path
referrer | String | (id) The referrer URL (Where the request is originated/redirected from) (Mapped to a Page Entity) Please note: Everything after ? will be removed and added to the reference  properties (not pageview properties).
referrer_properties | JSON | Custom request properties of the referrer URL
keyword | String | Search term
method | String | **GET**, POST, PUT, DELETE, PATCH (Defaults to GET)
response_code | Integer | HTTP Response code (Defaults to 200)
size | integer | Size of response in bytes
protocol | String | Defaults to HTTP
page_content | List<Relations> | List of content Items/Entities types: FEATURED, LISTED, RELATED, TEASED, ADVERTISED


**Applies to:** [`Events`](#introduction-to-events)</br>
**Enhance by:** [`Timed`](#timed), [`Dimensions`](#dimensions-metricsfacts)

## Presentation
```shell
Simple event that includes simple presentation information
{
  "action": "as.ecom.product.browse",
  "source": "com.activitystream.www",
  "involves": [
    {"ACTOR":"User/stefanb"}
  ],
  "aspects": {
    "presentation": {
      "label":"Stefán Baxter",
      "details_url":"%or.etru%/customers/stefanbaxter",
      "thumbnail":"http://activitystream.com/employees/stefanbaxter.png"
    }
  }
}
Simple event that includes the update aspect to set presentation information for an entity
{
  "action": "as.entity.update",
  "source": "some.internal.system.process",
  "involves": [
    {"ACTOR":"User/stefanb"},
    {"AFFECTS":"Customer/311068"}
  ],
  "aspects": {
    "update": {
      "aspects": {
        "presentation": {
          "label":"Stefán Baxter",
          "details_url":"%or.etru%/customers/stefanbaxter",
          "thumbnail":"http://activitystream.com/employees/stefanbaxter.png"
        }
      }
    }
  }
}
```
Commonly used fields to display human-readable entity information but applies to events as well.

Field | Type | Description
----- | ---- | -----------
label | String | Name or human readable label for the event/entity
description | String | A short description of the entity
details_url | String | Home URL for the entity. Pointer to entity details.*
thumbnail | String | URL pointing to a default thumbnail/image used to represent the entity*
icon | String | URL pointing to a default icon/logo used to represent the entity* (css classsname)

* All URLs can, with use of  templating, be based on values from the source or the event_type record.

**Applies to:** [`Events`](#introduction-to-events), [`Entities`](#introduction-to-entities), [`Event-Types`](), [`Entity-Types`]()</br>

## Resolvable
```shell
{
  "action": "as.auth.failed",
  "source": "com.activitystream.www",
  "involves": [
    {"ACTOR":"User/stefanb"}
  ],
  "aspects": {
    "resolvable": {
      "external_id":"342",
      "batch_id":"sfds"
    }
  }
}
```
If the originating system already has an ID for the event that it must to use to resolve the event in the activity stream then an external_id can be supplied.

The batch_id is used to tag a whole batch of events so that they can be invalidated later on if, for example, a transaction fails. The batch_id is always resolved for a specific/single source but many events can have the same batch_id.

This can, for example, be used to rollback external transaction. As the activity stream is a append-only event store then the events are rolled-back by invalidating them (which leaves them in the stream but hides them).

Field | Type | Description
----- | ---- | -----------
external_id | String | When external systems need to find individual events based on their own event ID then they can supply it using this aspect.</br>*external_id is unique within the source and needs source information to be resolved.
batch_id | String | External batch id which can be used, when supplied with source, to resolve a whole batch of events.</br>*batch_id is resolved with source information.

**Applies to:** [`Events`](#introduction-to-events)</br>

## Settings
```shell
{
  "action": "as.settings.changed",
  "source": "com.activitystream.www",
  "involves": [
    {"ACTOR":"User/stefanb"}
  ],
  "aspects": {
    "settings": {
      "volume":"3",
      "active_channel":"32",
      "active_profile":"family"
    }
  }
}
```
Use the Setting aspect to track changes for configuration/settings. Multiple settings can attached to a single event and you can always ask for the settings as they were at a specific time for the associated entity.

\**Please note that the settings are associated with the “AFFECTS” entity if available or the “ACTOR" entity if no ‘track_for’ target is specified.*

"setting"="new_value"
Name of the setting that is affected and the new/current value for the setting.

**Applies to:** [`Events`](#introduction-to-events), [`Entities`](#introduction-to-entities) (Indirectly via events)</br>

## Summary
```shell
{
  "action": "as.rewards.unlocked",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.001Z",
  "involves": [
    {"ACTOR":"Session/9fa660bb-9c43-4214-b603-882453ccf088"}
  ],
  "aspects": {
  "summary": {
    "title":"Stefán has now unlocked the 'Ignorant dude' trophy",
    "subtitle":"by answering 30 questions incorrectly",
    "content":"One awesome dry spell!"}
  }
}
```
Used to store customized title & summary information.

Field | Type | Description
----- | ---- | -----------
title | String
subtitle | String
content | String
properties | JSON | JSON containing additional, customer specific, information

Please note that the action (“as.app.reward.unlocked” in this case) can also have title information attached to it and that storing a common template there can be more efficient than storing redundant strings with every event.

**Applies to:** [`Events`](#introduction-to-events), [`Entities`](#introduction-to-entities)</br>
**Compliments:** [`Presentation`]()

## Tags
```shell
{
  "action": "as.auth.failed",
  "source": "com.activitystream.www",
  "involves": [
    {"ACTOR":"Username/stefanb"}
  ],
  "aspects": {
    "tags": ["Severe","Red"]
  }
}
```
An array of strings used to further classify events in the activity stream. You can use any tag you like but keep in mind that a small set (low cardinality) of tags is commonly more useful than a large set of tags.


**Applies to:** [`Events`](#introduction-to-events), [`Entities`](#introduction-to-entities)</br>

## Timed
```shell
//With began and ended (explicit):
{
  "action": "as.session.ended",
  "source": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "involves": [
    {"ACTOR":"Session/9fa660bb-9c43-4214-b603-882453ccf088", "PROXY_FOR":"User/311068"}
  ],
  "aspects": {
    "timed": {"begins":"2014-02-23T11:50:00.000Z", "ends":"2014-02-23T12:00:00.000Z"}
  }
}

//With began and duration (explicit using duration):
{
  "aspects": {
    "timed": {"begins":"2014-02-23T11:50:00.000Z", "duration":600000}
  }
}

//With began only (Implicit: using occurred_at as ended):
{
  "aspects": {
    "timed": {"begins":"2014-02-23T11:50:00.000Z"}
  }
}

//With duration only (Implicit: using occurred_at as ended and occurred_at-duration as began):
{
  "aspects": {
    "timed": {"duration":600000}
  }
}
```
If the action that the event is based on has duration the it can be represented here. This can, for example, be the time a AB Test took or the duration of a session reported at the end of the session.

**Please Note**: It it’s unclear to which part of your event message the timed aspect applies to then it’s a good sign of your event message becoming too bloated. Creating two separate events, even of two different event types, is recommended in such cases.

Field | Type | Description
----- | ---- | -----------
begins | ISO Date |
ends | ISO Date |
duration | Long | Milliseconds
type | String | Any custom type ("Duration" for example)

**Applies to:** [`Events`](#introduction-to-events) [`Entities`](#introduction-to-entities)</br>
**Enhances:** [`Pageview`](), [`AB_Test`]()</br>

## TS Data (Data-Points)
```shell
Sample of a event message that piggybacks a timeseries entry
{
  "action": "as.sysops.status.report",
  "source": "com.activitystream.server1",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "involves": [
    {"ACTOR":"Demon/Sysops"}
  ],
  "aspects": {
    "ts_data": {
       "series":"sfsd",
       "volume":3,
       "free_disk_space_pc":92,
       "machine_load":1.5
    },
    "dimensions": {
      "machine_type":"virtual",
      "instance_type":"small"
    }
  }
}
```
In addition to be registered in the AS event-entity graph the event updates a time series with this data-point.

**Please note:** For high frequency, fixed interval, time-series we recommend using the DataPoint message rather than sending in regular events with the ts_data aspect.

Additional dimensions are added from Locale, Client Device and GeoLocation. Additional/manual dimensions can be set using the dimensions aspect.

## Transaction

Field | Type | Description
----- | ---- | -----------
**type** | String | Payable/Receivable or Debit/Credit
**medium** | String | Cash, Card, Check, Transfer, Other
**amount** | Double | The transferred amount (The [Locale](#locale) aspect is used to specify currency)
invoice_nr | String |
reference_no | String |
account_out | String |
account_in | String |
accounting_key | String |
card_number  | String | Obfuscated only (Meta card numbers only)
card_exp  | String | Expiration data
properties | JSON | Any JSON structure containing customer/transaction specific information

**Applies to:** [`TSData`]()</br>
**Enhanced by:** [`dimensions`](#dimensions-metricsfacts)
