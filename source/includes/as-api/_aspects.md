#Aspects
Aspects are commonly used message extensions which have rich support in Activity Stream in regards to processing and representation. The offer a normalized/structured way to store common information in a way that makes it possible for us to build rich functionality and ui that meet common needs without restricting customization.

You can mix and match aspects to trigger the desired functionality for any custom event as well as events from the Activity Stream Event Library.

Event message can include multiple aspects or none at all but it’s good to keep in mind that a clear sign of bloated event messages is if the aspect do not seem to fit together or it’s unclear what aspects affect in the message. In other words; it’s sometimes better to send more messages than cram everything into one.

## AB Testing
```shell
A partial purchase-message illustrating the use of the ab_testing aspect:
{
  "type": "as.ec.cart.purchased",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {"ACTOR":"Session/KJ982KJ2", "proxy_for":"Customer/311068"},
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

**Applies to:** `Events`</br>
**Enhanced with:** [`Dimensions*`](), [`Timed**`]()

*\*Use the classification aspect to add dimensions to the AB_Test outcome.*</br>
*\*Use the timed aspect to report how lon the AB test took.*

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.
* See [Analytic queries](/analytics.html#ab-testing-analytics) for information on fetching ab-testing analytics.
* See [Streaming updates]() for information on how to subscribe to streaming ab-testing events.

## Attachments
```shell
A partial email-sent-message illustrating the use of the attachments aspect:
{
  "type": "as.crm.email.sent",
  "origin": "com.activitystream.www",
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

**Applies to:** `Events`

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.

## Client Device
```shell
A partial login-message illustrating the use of the client_device aspect:
{
  "type": "as.auth.login",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "proxy_for":"Customer/311068"
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
  "type": "as.auth.login",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "proxy_for":"Customer/311068"
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
bind_to* | String | Common or long-lived information, like this, may be moved to the ACTOR entity if it applies to all events from the actor.</br>In web context then this is used to apply certain redundant information to the Session entity. There it would be stored only once per session or a few time if it changes during the section. Multiple entries are stored for slow changing aspects to keep complete auditing log.
\_device_vendor | String |
\_device_type | String |
\_device_pname | String |
\_brower_vendor | String |
\_browser_type | String |
\_browser_version | String |
\_os_type | String |
\_os_version | String |
\_is_input_device | Boolean |
\_is_tablet | Boolean |
\_is_wireless | Boolean |
\_display_width | Integer
\_display_height |Integer

**Applies to:** `Events`

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.


## Client IP
```shell
A partial login-message illustrating the use of the client_ip aspect:
{
  "type": "as.auth.login",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "proxy_for":"Customer/311068"
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
  "type": "as.auth.login",
  "origin": "com.activitystream.www",
  "occurred_at": "2014-02-23T12:00:00.000Z",
  "entities": [
    {
      "ACTOR":"Session/S434F4K223J",
      "proxy_for":"Customer/311068"
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
bind_to* | String | Common or long-lived information, like this, may be moved to the ACTOR entity if it applies to all events from the actor.</br> In web context then this is used to apply certain redundant information to the Session entity. There it would be stored only once per session or a few time if it changes during the section. Multiple entries are stored for slow changing aspects to keep complete auditing log.
\_isp | String | Name of the ISP if it could be resolved for the IP
\_organization | String | Name of the Organization the IP if it could be resolved for the IP
\_reverse_dns | String | Reverse DNS Name for the IP if it could be resolved
\_geolocation | Map | GeoLocation entry if existed for the IP (See GeoLocation)
\_locale | Map | Locale entry if existed for the IP (See Locale)

* Needs updating

**Applies to:** `Events`

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.


## Customer Experience Index (CEI)
```shell
A partial password-changed-message illustrating the use of the cei aspect:
{
  "type": "as.auth.password.change",
  "origin": "com.activitystream.www",
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
Each event can have synthesized/imagined effect on the entities affected by it. When applicable it can, for example, be used to guesstimate the current state of a customer based on the things in his activity stream.

The defaults for this can be stored with the event type and applied to all events where these settings are missing.

A calculated outcome of these can be used as a Customer Experience Index or a factor in such an index.

Field | Type | Description
----- | ---- | -----------
engagement | Float | Is the target engaged</br>inactive <-> active (-5 … +5)
happiness | Float | Is the target experiencing good or bad things</br>frustrated <-> happy (-5 … +5)
care | Float | Is the user being attended to</br>neglected <-> pampered (-5 … +5)
intent | Float | Is the target doing good or bad things</br>evil <-> good (-5 … +5)
points | Float | Points being scored
traction* | Long | For how long does this affect the entity (in minutes) (See duration serialization).</br>*Defaults to 120 days (120 days * 1.440 minutes = 172.800 minutes)
affects | String[] | List of the entities that should be affected by this. (ACTOR/AFFECTS etc.)</br>"ACTOR" is the default target for profiling values.

**Applies to:** `Entities via Events`

### Additional queries and interfaces
* See [Events](#events) for information on sending the event to AS.
* See [Analytic queries](/analytics.html#cei-analytics) for information on fetching CEI analytics.

## Demography
```javascript
{
  "entity_ref": "Customer/311068",
  "aspects": {
    "demography": [
      {
        "gender":"male",
        "birth_year":1968,
        "marital_status":"married"
      }
    ]
  }
}
```

Field | Type | Suggested values (but you can surely use your own)
----- | ---- | -----------
gender | String | **Male**, **Female**, **Unknown**, **Trans Female**, **Trans Male**, **Trans Person**, **Gender Variant**, **Gender Questioning**, **Bigender**, **Androgynous**, **Pangender**, **Transsexual**.
birth_year | Integer | 1930 ... 201X
ethnicity | String | **White**, **Hispanic** / **Latino**, **Black** / **African American**, **Native American** / **American Indian**, **Asian** / **Pacific Islander**, **Multiracial**, **Other**
marital_status | String | **Single** (never married), **Married** or **In-Partnership**, **Widowed**, **Divorced**, **Separated**, **Other**
education | String | **No schooling**, **Primary school** (up to 11th grade), **No diploma** (12th grade), **High school** (graduate/GED), Some **College credit** (No degree), **Associate degree** (AA, AS), **Bachelor's degree** (BA, AB, BS), **Master's degree** (MA, MS, MEng, MEd, MSW, MBA), **Professional degree** (MD, DDS, DVM, LLB, JD), **Doctorate degree** (PhD, EdD)
family_size | String | 1 .. XX
employment | String | **Employed**, **Self-employed**, **Out of work and looking**, **Out of work not looking**, **A homemaker**, **A student**, **Military**, **Retired**, **Unable** to work, **Other**
disability | String |
income | String |
housing | String |
properties | JSON | Free format JSON structure with custom information

**Applies to:** `Entities` (Entities that represent individuals)</br>
**Enhanced with:** [`Locale*`](#locale)  [`Timed*`](#timed)

### Additional queries and interfaces
* See [Entities](#entities) for information on updating entities in AS.
* See [Update](#update) for information on how to update entities with event messages.

## Dimensions (Classification)
## Geo Locations
## Grouped
## Items (xCommerce)
## Locale
## Messaging
## Page View
## Presentation
## Resolvable
## Settings
## Summary
## Tags
## Timed
## TS Data (Data-Points)
## Transaction
## Update
