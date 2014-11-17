# Time-Series
##Introduction to time-series and data-points
Data points are time-series entries that can be reported individually, in batches or as an integrated part of an event message using the ts_data aspect.

Activity Stream includes a real-time analytics store that is capable of storing data points with multiple dimensions which are available for querying as soon as submitted. 

Think of the AS time series as a OLAP/Cube which is updated continuously and can be sliced and diced at will.

## Data-point-message properties
```shell
Single metric submitted to the analytics store:
{
  "series": "SystemHealth",
  "origin": "server1",
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
  "origin": "as.cep3",
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
**origin** | String | Where is the data-point originated from (Source System). </br>The origin becomes a dimension in the time-series entry.
**occurred_at** | DateTime | ISO serialized datetime representing the exact time that the event occurred at the origin/source system.</br>Handling of data-points in AS differs from other events messages and a default occurred_at value is not provided. This means that the originating system must always provide the correct “measurement time” for data-points.
entities | List<relation> | A link between the Entity and the Time-series is created the first time the entity is referenced from a data-point belonging to the time-series. This is done to track the relations between entities and time-series.
aspects | Map | The data-point information is separated into 1 to 3 different aspects depending on the nature/purpose of the information.
 | |  These are some of the same aspects available for AS Event Messages and are documented below.
 | |    - ts_data
 | | Map 
 | | A Key/Value pair representing metric+value pairs for the time-series where the value is always numeric (double).
 | |    - dimensions
 | | Map
 | | A key value pair representing a dimension and the corresponding dimension values.  Dimensions are useful for querying, aggregating and faceting time-series data. 
 | |    - geo_location
 | | String
 | | A lat,long string containing valid geo coordinates. Simple Geo queries will be supported shortly (they are currently supported as an experimental feature in Druid).

**Valid aspects:** [`dimensions`]() [`ts_data`]() [`geo_location`]()

## Additional queries and interfaces
* See [Streaming updates]() for information on how to subscribe to streaming event updates.
* See [Analytic queries]() for information on fetching analytic information for the submitted data-points.
