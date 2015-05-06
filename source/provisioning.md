---
title: Provisioning API

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>Activity Stream API</a>
  - Provisioning API
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/recipes.html#'>Recipes</a>

includes:

search: true
---

# Introduction
This document will help you with all the things you need to configure your Activity Stream Service via an API.

## Tenant Information
```shell
/api/v1/provisioning/info
{
   label: "mobilitus",
   name: "Mobilitus",
   active: true,
   icon: "mobilitus.png",
   theme: null,
   tenantServices: [ ]
}
```
Basic tenant information and configuration.

### REST Actions
Verb | URL | Action
---- | ----------- | -----------
**GET**  | /api/v1/provisioning/info | Tenant main config and services
**PUT**  | /api/v1/provisioning/info | Update icon, theme and name configuration. </br> - The rest is read-only
**GET**  | /api/v1/provisioning/details | Get complete tenant details and services. </br> - All information except user privileges

### Tenant Fields
Field | Type | Description
----- | ---- | -----------
**`name`** | String | Full name of the tenant
**`label`** | String | The "slugified" tenant name (Most often the same as the primary domain name for the organization)
**`active`** | Boolean | Is the tenant currently running/active
`icon` | String | The company logo used to brand the admin pages
`theme` | String | The theme used for the admin interfaces
`tenantEndpoints` | List | List of configured End-points for event/information messaging
`tenantServices` | List | List of active services for the tenant
`tenantDomainMappings` | List | List of domains that Activity Stream is configured to serve for the tenant (API, Admin etc.)

## Users
```shell
GET: /api/v1/provisioning/users/<some-user>
{
    username: "<some-user>",
    email: "tenant+<some-user>@activitystream.com",
    firstName: null,
    lastName: null,
    timeZone: null,
    country: "ISL",
    zipCode: "108",
    avatar: "",
    gender: "M",
    birthYear: null,
    tenantUserPrivileges: [
        {
            role: "ADMINISTRATOR",
            activeFrom: "2014-08-20T17:44:33Z",
            activeUntil: null
        }
    ],
    activeApiKeys: [
        {
            apiToken: "<some-api-key>",
            type: "BASIC",
            activeFrom: "2014-08-26T08:21:30Z",
            activeUntil: null
        }
    ]
}
```
### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET  | /api/v1/provisioning/users | List Active Users
GET  | /api/v1/provisioning/users/{username} | Get a single user
POST | /api/v1/provisioning/users | Add a new user
PUT  | /api/v1/provisioning/users/{username} | Update a single user
DELETE  | /api/v1/provisioning/users/{username} | Revoke all privileges for the user for active tenant
GET | /api/v1/provisioning/users?q=\<info\> | Search for User already with tenant privileges
GET | /api/v1/provisioning/as-users?q=\<info\> | Global Search for AS Users

### User Fields
Field | Type | Description
----- | ---- | -----------
**`username`** | String | A unique user name (most often the email)
**`email`** | String | User email
**`password`** | String | Required when creating a user (otherwise not disclosed)
`firstName` | String | First name of the user
`lastName` | String | Last name of the user
`timeZone` | String | Local user timezone
`country` | String | Location of the user
`zipCode` | String | Zipcode of the user
`avatar` | String | Avatar image used to represent the user
`gender` | String | The gender of the user  M/F/U
`birthYear` | Integer | The birth year of the user
`hint` | String | Password hint for the user
`tenantUserPrivileges` | List | List of privileges awarded to the user
`activeApiKeys` | List | List of active API keys assigned to the user


## Privileges
```shell
GET /api/v1/provisioning/privileges/<some-user>
{
    role: "ADMINISTRATOR",
    activeFrom: "2014-09-09T13:49:29Z",
    activeUntil: null,
    user: {
        firstName: "<some-user-firstName>",
        lastName: "<some-user-lastName>",
        email: "tenant+<some-user>@activitystream.com",
        avatar: null,
        username: "<some-user>"
    }
}
```
### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/privileges | List all user privileges
GET | /api/v1/provisioning/users/{username}/privilege | Get a user privilege
POST | /api/v1/provisioning/users/{username}/privilege | Add new user privilege
PUT | /api/v1/provisioning/users/{username}/privilege | Update user privilege
DELETE | /api/v1/provisioning/users/{username}/privilege | Revoke user privileges

### Privilege Fields
Field | Type | Description
----- | ---- | -----------
**`role`** | String | USER - Can see his own things</br> TEAM_LEADER - Can see his own things and things of immediate subordinates</br> MANAGEMENT - Can see his own things and things of all subordinates</br> ADMINISTRATOR - Can Manage everything</br> INTERNAL_AUDITING - Can see everything but Manage nothing
`activeFrom` | DateTime | Activation Date (Defaults to now if not provided with future date)
`activeUntil` | DateTime | De-Activation Date


## Domain Mapping
```shell
GET /api/v1/provisioning/domain-mapping/<some-domain.com>
{
    domain: "<some-domain.com>",
    icon: "",
    theme: "",
    activeFrom: "2014-09-09T13:50:17Z",
    activeUntil: null
}
```

### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/domain-mapping | List domain mappings
POST | /api/v1/provisioning/domain-mapping | Add domain mapping
PUT | /api/v1/provisioning/domain-mapping/{domain} | Update domain mapping
DELETE | /api/v1/provisioning/domain-mapping/{domain} | Delete domain mapping

### Domain Mapping Fields
Field | Type | Description
----- | ---- | -----------
**`domain`** | String | A fully qualified domain name that AS should service for this tenant
`icon` | String | The icon used to brand the UI
`theme` | String | The theme used for AS when this mapping is accessed
`activeFrom` | DateTime | Activation Date (Defaults to now if not provided with future date)
`activeUntil` | DateTime | De-Activation Date


## Services & Service Subscriptions

### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/services | Lists active services
GET | /api/v1/provisioning/available-services | Lists available services
GET | /api/v1/provisioning/available-services/{service-label} | Fetch a service description for a single services
GET | /api/v1/provisioning/services/{service-label} | Fetch a single subscription
POST | /api/v1/provisioning/services/{service-label} | Add a service subscription
PUT | /api/v1/provisioning/services/{service-label} | Change a service subscription
DELETE | /api/v1/provisioning/services/{service-label} | Remove a service subscription

### Service Fields
Field | Type | Description
----- | ---- | -----------
**`name`** | String(250) | Full name of the service
**`label`** | String(32) | A slug/label for the service
**`type`** | String | Types: INTERNAL, MANDATORY, SUBSCRIPTION_PLAN, OPTIONAL, PREMIUM, EXCLUSIVE, CUSTOM
**`status`** | String | Statuses: ALPHA, BETA, PRODUCTION, ARCHIVED
`icon` | String(50) | Icon used to label the service
`preview` | String(250) | URL/Path to a preview image for the service
`shortDescription` | Text | A short description of the service
`description` | Text | A full description of the service

### Service Subscription Fields
Field | Type | Description
----- | ---- | -----------
**`service`** | Service | The service that the subscription applies to
**`registeredBy`** | User | The user that created the subscription
`activeFrom` | DateTime | The day that the subscription became active
`activeUntil` | DateTime | the day that the subscript became inactive
`registeredDate` | DateTime | the day that the subscription was created

## Dashboards

### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/dashboards | All dashboards available
GET | /api/v1/provisioning/dashboards/{label} | Information on a single dashboard
GET | /api/v1/provisioning/tenant-dashboards | Custom tenant dashboards
GET | /api/v1/provisioning/tenant-dashboards/{dashboard-label} | Information on a custom tenant dashboards
GET | /api/v1/provisioning/service-dashboards | All dashboards available (Custom + belong to active services)
POST | /api/v1/provisioning/tenant-dashboards | Add a custom dashboard
PUT | /api/v1/provisioning/tenant-dashboards/{dashboard-label} | Update a custom dashboard
DELETE | /api/v1/provisioning/tenant-dashboards/{dashboard-label} | Remove a custom dashboard

### Dashboard Fields
Field | Type | Description
----- | ---- | -----------
**`title`** | String(250) | Title displayed on the top of the dashboard
**`menuLabel`** | String(50) | Menu label for the dashboard
**`label`** | String(50) | Slug / URL label for the dashboard
**`type`** | String |REAL_TIME, OI_OVERVIEW, ENTITY_OVERVIEW, SYSTEM, SETTINGS, CUSTOM
**`status`** | String |ALPHA, BETA, PRODUCTION, ARCHIVED
**`listOrder`** | int | Menu ordering (listOrder+label)
`subtitle` | String(250) |Subtitle displayed on the top of the dashboard
`biLine` | String(50) | Text displayed with the preview image
`preview` | String(250) | URL/Path to a preview image for the dashboard
`path` | String(250) | Optional, custom, path to map the dashboards to
`icon` | String(50) | Icon used to label the dashboard (With title and in menu)
`template` | String(250) | Optional template to use to render the dashboard (?)
`description` | Text | A description of dashboard content
`settings` | JSON | The settings used to construct the dashboard.


## Statements
This API is only accessible for Enterprise licenses

### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/statements | All OI statements available
GET | /api/v1/provisioning/tenant-statements | Custom made OI statements
GET | /api/v1/provisioning/service-statements | All OI Statements available (Custom + belong to active services)
POST | /api/v1/provisioning/tenant-statements | Add a custom statement
PUT | /api/v1/provisioning/tenant-statements/{statement} | Update a custom statement
DELETE | /api/v1/provisioning/tenant-statements/{statement-label} | Remove a custom statement
GET | /api/v1/provisioning/statements/{statement-label}/config | Get configuration for the specified statement
PUT | /api/v1/provisioning/statements/{statement-label}/config | Update the configuration for the specified statement
GET | /api/v1/provisioning/statements/{statement-label}/details | Get detail information for the specified statement

### Statement Fields
Field | Type | Description
----- | ---- | -----------

## Service Endpoints
```shell
GET /api/v1/provisioning/service-endpoints/<endpoint.id>
{
    id: <endpoint.id>,
    url: "<server.url>",
    userName: "admin",
    password: "<password>",
    provUserName: "admin",
    provPassword: "<password>",
    provPort: null,
    apiKey: "",
    messageHandler: "",
    exchange: "<exchange>",
    binding: "#",
    active: true,
    durable: true,
    vhost: "<tenant-specific-vhost>",
    activeFrom: "2014-09-09T13:36:07Z",
    activeUntil: "2016-09-09T13:36:08Z",
    registeredByUserId: 1,
    registeredDate: "2014-09-09T13:37:36Z",
    endpointType: {
        id: 1,
        name: "Incoming MQ",
        label: "MQ_INCOMING",
        internal: false,
        shortDescription: "Events from Customer to Enrichment & Historical processing. REST API published received messages also to this queue if they are valid. "
    }
}
```
Service endpoints describe how data is sent/fetched from the tenant into Activity Stream and how information from Activity Stream is delivered back to him.

Event messages can be submitted without configuration via the REST/HTTP interface but also sent directly to a Message Queue at Activity Stream but we can also fetch event-messages from message queues belonging tour tenants.

We provide error feedback and operational insights via message queues that, like with ingestion, reside with us or our tenants.

### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/endpoints | List service-endpoint
POST | /api/v1/provisioning/endpoints | Add service-endpoint
PUT | /api/v1/provisioning/endpoints/{id} | Update service-endpoint
DELETE | /api/v1/provisioning/endpoints/{id} | Delete service-endpoint


### Service Endpoint Fields
Field | Type | Description
----- | ---- | -----------
**`url`**|String|The URL of the server that renders the service
**`endpointType`**|Map|The Endpoint Type
`userName`|String|Username used to access the service
`password`|String|Password used to access the service
`provUserName`|String|The Username used for provisioning the service (If applicable)
`provPassword`|String|The Username password for provisioning the service (If applicable)
`provPort`|String|An alternative port used to access provisioning of the service
`apiKey`|String|A API key to use to access the service (Alternative to user/pass)
`messageHandler`|String|A custom message handler used to communicate with the service
`exchange`|String|The exchange used (if service is Message Queue)
`binding`|String|The binding used (if service is Message Queue)
`active`|String|Is the service active
`durable`|String|Is the message queue durable (if service is Message Queue)
`vhost`|String|The vhost used (if service is Message Queue)
`activeFrom`|String|When does/did the service become available
`activeUntil`|String|When will/did the service become un-available
*`registeredDate`*|String|When was the service registered (Read-Only)


## API Keys
```shell
GET /api/v1/provisioning/api-keys/<apiToken>
{

    "apiToken": "<apiToken>",
    "type": "BASIC",
    "activeFrom": "2014-12-13T10:02:43Z",
    "activeUntil": null,
    "createdDate": "2014-12-13T10:02:47Z"

}
```
### REST Actions

Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/api-keys | Lists tenant-only Api Keys
GET | /api/v1/provisioning/api-keys/{apiToken} | Lists tenant-only Api Keys
GET | /api/v1/provisioning/api-keys/{apiToken} | Fetch a single, tenant-only, API key
GET | /api/v1/provisioning/user-api-keys | Lists user assigned Api Keys
GET | /api/v1/provisioning/users/{user}/api-keys | List Api Keys assigned to a particular user
POST | /api/v1/provisioning/users/{user}/api-keys | Create a new Api Key
GET | /api/v1/provisioning/users/{user}/api-keys/{apiToken} | Fetch a single, user-assigned, API key
PUT | /api/v1/provisioning/users/{user}/api-keys/{apiToken} | Update and Api Keys assigned to a particular user
DELETE | /api/v1/provisioning/users/{user}/api-keys/{apiToken} | Delete an API Key

### Service Endpoint Fields
Field | Type | Description
----- | ---- | -----------
**`type`**|STRING|INGESTION_ONLY - Can only be used to submit event-messages</br>QUERY_ONLY - Can only be used to query date</br>BASIC - Normal (User access depends on privileges)
*`apiToken`*|String|Read-Only
*`dateCreated`*|String|Read-Only
`activeFrom` | DateTime | Activation Date (Defaults to now if not provided with future date)
`activeUntil` | DateTime | De-Activation Date

## Global request parameters for search and paging
Field | Description | Example
----- | ----------- | -----------
`page` | page number starting from 0 | ?page=2
`size` | number of items per page. Defaults to 20 | ?size=10
`order` | Field to order by | -
`q` | query string (Functionality varies slightly based on end-point) | ?q=\<some-email\>


<!--
  - <a href='/graph.html#'>SQL Graph Queries</a>
  - <a href='/as-catalog.html#'>The AS Event-Type Catalog</a>
  - <a href='/recipes.html#'>Recipes</a>
  - <a href='/details.html#'>Details & references</a>
-->