# Time-Series
##Introduction to time-series and data-points
Activity Stream includes a real-time analytics store that is capable of storing data-points with multiple dimensions and metrics.

Time-series consist of data-points that can be reported individually, in batches or as an integrated part of an event-messages using the ts_data aspect.

All data-points are available for querying as soon as submitted.
All data-points are available for querying as soon as submitted.

## Data-point-message properties
```shell
Single metric submitted to the analytics store:
{
  "series": "SystemHealth",
  "source": "server1",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "aspects": {
    "ts_data": {
      "load":5.6
    }
  }
}

Multiple data-points having additional dimensions and a entity references submitted to the analytics store:
{
  "series": "CaptchasTooManyFailed",
  "source": "as.cep3",
  "occurred_at": "2014-01-19T12:56:48.442Z",
  "entities": [
    {"AFFECTS": "Customer/3110686369"}
  ],
  "aspects": {
    "ts_data": {
      "importance":3,
      "tries":1
    },
    "dimensions": {"type":"Google"}
  }
}
```

Property | Type | Description
-------- | ---- | -----------
**series** | String | The Time-Series label/name.</br>First time a series label is used the timeseries is instantiated and should require no additional preparation.
**occurred_at** | DateTime | ISO serialized datetime representing the exact time that the event occurred at the source system.</br>Handling of data-points in AS differs from other events messages and a default occurred_at value is not provided. This means that the originating system must always provide the correct “measurement time” for data-points.
source | String | Where is the data-point originated from (Source System). </br>The source becomes a dimension in the time-series entry.
involves | List\<Role\> | A link between the Entity and the Time-series is created the first time the entity is referenced from a data-point belonging to the time-series. </br>AFFECTS, REFLECTS, REFERENCES</br>This is done to track the relations between entities and time-series.
aspects | Map | The data-point information is separated into 1 to 3 different aspects depending on the nature/purpose of the information.
&nbsp;&nbsp;&nbsp;&nbsp;ts_data| Map | A Key/Value pair representing metric+value pairs for the time-series where the value is always numeric (double).
&nbsp;&nbsp;&nbsp;&nbsp;dimensions| Map | A key value pair representing a dimension and the corresponding dimension values.  Dimensions are useful for querying, aggregating and faceting time-series data.
&nbsp;&nbsp;&nbsp;&nbsp;geo_location| String | A lat,long string containing valid geo coordinates. Simple Geo queries will be supported shortly (they are currently supported as an experimental feature in Druid).

**Valid aspects:** [`ts_data`]() [`dimensions`]()  [`geo_location`]()

## Submit via REST API
```shell
Returns this:
{
}
```
###Submit Timeseries Data (Datapoints) [POST]:
https://`{tenant-label}`.activitystream.com/api/collector/v1/data-points?apikey=`{api-key}`
`Headers` `Content-Type: application/json`

###Check if event-message is validate [POST] (Nothing gets persisted):
https://`{tenant-label}`.activitystream.com/api/v1/data-points/validate?apikey=`{api-key}`

###Request properties
Property | Description
-------- | -----------
`{api-key}` | Your API (unless pre-authenticated)

Header| Description
-------- | -----------
Content-Type | application/json

## Submit via Message Queue
```shell
Returns nothing except an acknowledgement from the queue that the message has been received.
```
###Connection Settings
Property | Description
-------- | -----------
server | receiverX.activitystream.com (unless you are using a local RabbitMQ cluster)
vhost | {tenant-label} name unless you are using a local RabbitMQ cluster and the it's the same as you configured in AS admin/setup.
exchange | to-activitystream
message_key | as.api.datapoint

## TS - Metadata API

###Fetch a list of all available time-series [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`&apikey=`{api-key}`

###Fetch all the metadata for a certain time-series [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series/`{time-series}`?apikey=`{api-key}`

###Save aspect information and properties for a single timeseries [PUT]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series/`{time-series}`?apikey={api-key}`

###Fetch all the metrics that have been used in a certain time-series [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series/`{time-series}`/metrics?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`&apikey=`{api-key}`

###Fetch all the dimensions that have been used in a certain time-series [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series/`{time-series}`/dimensions?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`&apikey=`{api-key}`

###Fetch all the source that have submitted data into a certain time-series [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series/`{time-series}`/source?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`&apikey=`{api-key}`

###Fetch all the entities active in a certain time-series [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/time-series/`{time-series}`/entities?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`&apikey=`{api-key}`

###Fetch all the timeseries active for a certain entity [GET]:
https://`{tenant-label}`.activitystream.com/api/v1/as/entities/`{entity-type}`/`{entity-id}`/time-series?page=`{page-nr}`&pagesize=`{items-on-page}`&filter=`{filter}`&apikey=`{api-key}`

Property | Description
-------- | -----------
`{api-key}`| Your API key
`{time-series}`| The label of the time series
`{entity-type}`| The part of the {entity_ref} that specifies the Entity/Object Type. Car, Customer, Order are all examples of entity types. This is normally the table name in your database or a human readable version of it.
`{entity-id}`| The unique id of the entity with that entity-type. This is normally the ID of the entity in your database.
`{page-nr}`| The page number to fetch. 1 is the first page and also the default value.
`{items-on-page}`| Specifies how many items should be on each page. 20 is the default value and 300 is the maximum value.
`{filter}`| A SQL filter (where clause) to apply to the result set. Please read [SQL]() for further information on the graph enabled SQL dialect that we use
`{tenant-label}`| Each Activity Stream customer gets a tenant id. usually this matches the entity part of your email address.

## TS - Query API
* See [Analytic queries]() for information on fetching analytic information for the submitted data-points.
* See [Streaming updates]() for information on how to subscribe to streaming event updates.

**Please be advised:**
The support for “simple” time-series in AS is provided to accommodate traditional “metric+value timeseries data”. In AS we also have a multi-metric-multi-dimensional alternatives which are **currently available on request** as they require minimum configuration on our behalf (bound to become automatic). *Please let us know if that option is required by one of your use cases.*
