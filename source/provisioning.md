---
title: Provisioning API

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>Activity Stream API</a>
  - Provisioning API
  - <a href='/graph.html#'>SQL Graph Queries</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-catalog.html#'>The AS Event-Type Catalog</a>
  - <a href='/recipes.html#'>Recipes</a>
  - <a href='/details.html#'>Details & references</a>
  
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
`name` | String | Full name of the tenant
`label` | String | The "slugified" tenant name (Most often the same as the primary domain name for the organization)
`active` | Boolean | Is the tenant currently running/active
`icon` | String | The company logo used to brand the admin pages
`theme` | String | The theme used for the admin interfaces
`tenantEndpoints` | List | List of configured End-points for event/information messaging
`tenantServices` | List | List of active services for the tenant
`tenantDomainMappings` | List | List of domains that Activity Stream is configured to serve for the tenant (API, Admin etc.)

## Users
```shell
/api/v1/provisioning/users/modev
{
    username: "mobdev",
    email: "tenant+mobilitus@activitystream.com",
    firstName: "Mobilitus",
    lastName: "Tickets",
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
PUT  | /api/v1/provisioning/users/{username} | Update a single user
DELETE  | /api/v1/provisioning/users/{username} | Revoke all privileges for the user for active tenant
GET | /api/v1/provisioning/users?q=\<info\> | Search for User already with tenant privileges
GET | /api/v1/provisioning/as-users?q=\<info\> | Global Search for AS Users

### User Fields
Field | Type | Description
----- | ---- | -----------
`username` | String | A unique user name (most often the email)
`email` | String | User email
`firstName` | String |
`lastName` | String |
`timeZone` | String |
`country` | String |
`zipCode` | String |
`avatar` | String | The avatar
`gender` | String |
`birthYear` | Integer |
`hint` | String |
`tenantUserPrivileges` | List | List of privileges awarded to the user
`activeApiKeys` | List | List of active API keys assigned to the user


## Privileges
```shell
/api/v1/provisioning/privileges/{username}
{
    role: "ADMINISTRATOR",
    activeFrom: "2014-09-09T13:49:29Z",
    activeUntil: null,
    user: {
        firstName: "Language",
        lastName: "Genius",
        email: "tenant+cooori@activitystream.com",
        avatar: null,
        username: "coooridev"
    }
}
```
### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/privileges | List all privileges
GET | /api/v1/provisioning/users/{username}/privilege | Get a user privilege
PUT | /api/v1/provisioning/users/{username}/privilege | update user privilege
DELETE | /api/v1/provisioning/users/{username}/privilege | Revoke user privileges

### Privilege Fields
Field | Type | Description
----- | ---- | -----------
`role` | String | USER (Can see his own things)</br> TEAM_LEADER (Can see his own things and things of immediate subordinates)</br> MANAGEMENT (Can see his own things and things of all subordinates)</br> ADMINISTRATOR (Can Manage everything)</br> INTERNAL_AUDITING (Can see everything but Manage nothing)
`activeFrom` | DateTime | Activation Date
`activeUntil` | DateTime | De-Activation Date


## Domain Mapping
```shell
/api/v1/provisioning/domain-mapping/cooori.localhost
{
    domain: "cooori.localhost",
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
`domain` | String | A fully qualified domain name that AS should service for this tenant
`icon` | String | The icon used to brand the UI
`theme` | String | The theme used for AS when this mapping is accessed
`activeFrom` | DateTime | Activation Date
`activeUntil` | DateTime | De-Activation Date


## Services

Verb | URL | Action
---- | ----------- | -----------

## Dashboards

Verb | URL | Action
---- | ----------- | -----------

## Statements

Verb | URL | Action
---- | ----------- | -----------

## Service Endpoints
```shell
/api/v1/provisioning/service-endpoints/{id}
{
    id: {id},
    tenantId: 5,
    endpointTypeId: 1,
    url: "{server.url}",
    userName: "admin",
    password: "{password}",
    provUserName: "admin",
    provPassword: "{password}",
    provPort: null,
    apiKey: "",
    messageHandler: "",
    exchange: "from-cooori",
    binding: "#",
    active: true,
    durable: true,
    vhost: "cooori",
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
### REST Actions
Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/service-endpoints | List service-endpoint
POST | /api/v1/provisioning/service-endpoints | Add service-endpoint
PUT | /api/v1/provisioning/service-endpoints/{id} | Update service-endpoint
DELETE | /api/v1/provisioning/service-endpoints/{id} | Delete service-endpoint


### Service Endpoint Fields
Field | Type | Description
----- | ---- | -----------
url|String|
userName|String|
password|String|
provUserName|String|
provPassword|String|
provPort|String|
apiKey|String|
messageHandler|String|
exchange|String|
binding|String|
active|String|
durable|String|
vhost|String|
activeFrom|String|
activeUntil|String|
registeredDate|String|
endpointType|Map|

## API Keys

Verb | URL | Action
---- | ----------- | -----------

## Token

Verb | URL | Action
---- | ----------- | -----------


## Global request parameters for search and paging
Field | Description | Example
----- | ----------- | -----------
page | page number starting from 0 | ?page=2
size | number of items per page. Defaults to 20 | ?size=10
q | query string (Functionality varies slightly based on end-point) | ?q=\<some-email\>
