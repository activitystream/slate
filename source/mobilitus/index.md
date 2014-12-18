---
title: Mobilitus samples

language_tabs:

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>The Activity Stream API</a>
  - <a href='/analytics.html#'>Analytic Queries</a>

includes:

search: true
---

# Introduction
Here you will find the examples for Mobilitus and Promogogo.

In the following examples we are only changing the following path-based settings:

`/{dimensions}[,..]/[aggr:]{metric}[,..]/{granularity}/{from}/{to}?{dimension}={filter}[,…]&sort={metric}&limit={limit}?apikey=<api_key>`

Property | Description
-------- | -----------
**{dimensions}** | list of dimensions to include / group by.
**{metric}** | Metrics to include and the aggregation to use  (sum:, min:, max:, cardinality:, count:)
**{granularity}** | The aggregation period - ("all", "none", "minute", "fifteen_minute", "thirty_minute", "hour", "day" + ISO 8601 Periods: P2W, P3M, PT1H, PT1H30M)
**{from}** | ISO DateTime of period-starts to select the last XX minutes/days etc.</br>**Note** Always use local time (see tz for timezone adjustments)
{to} | ISO DateTime of period-ends to select the last XX minutes/days etc.</br>**Note** Always use local time (see tz for timezone adjustments)
{filter} | filter can be set with &\<dimension\>=value or &\<dimension\>=value,value for multiple values (regex are allowed but a lot slower)
{sort} | &sort=\<metric\> or &sort=-\<metric\> for descending
{limit} | &limit=<count>   (offset/paging is still missing). Ascending order and only 5 results: &order=<field>[..]&limit=5
{queryType} | use &queryType=timeseries to get a timeseries with 0 values for missing time slots.</br>**Note:** Timeseries can only be used if no dimensions (grouping) is selected
{tz} | use &tz=\<timezone-name\> to adjust all results for this timezone (eg. &tz=America/Los_Angeles)</br>**Note:** Do not use timezone in from-to settings (only local time for the specified timezone)

[See full documentation](/analytics.html#times-series-analytics)

#Sales Queries
The root path for all sales queries is:</br>
`https://as2-mobilitus.activitystream.com/api/analytics/trades/all`

##Sales

### Total sales for a single days broken down by currency code
```shell
Sample output:
[
  {
    version: "v1",
    timestamp: "2014-12-17T00:00:00.000Z",
    event: {
      count: 946,
      total_price: 188684.962890625,
      item_count: 2230,
      currency_code: "AUD"
    }
  },
  {
    version: "v1",
    timestamp: "2014-12-17T00:00:00.000Z",
    event: {
      count: 772,
      total_price: 153865.01953125,
      item_count: 1746,
      currency_code: "CAD"
    }
  }, ...
```
[/currency_code/item_count,count,total_price/day/2014-12-17/2014-12-18?action=PURCHASED&tz=America/Los_Angeles](https://as2-mobilitus.activitystream.com/api/analytics/trades/all/currency_code/item_count,count,total_price/day/2014-12-17/2014-12-18?action=PURCHASED&tz=America/Los_Angeles&apikey=T04VrmHjhmrhkWa4AtDv)

Setting | Value
-------- | -----------
Dimensions | `currency_code`
Metrics | `item_count`, `count`, `total_price`
Ganularity | `day`
Period | from: `2014-12-17` to: `2014-12-18`
Filter | `&action=PURCHASED`
type | `groupBy` (Default so we add no parameter
tz | `America/Los_Angeles`


##Events

### Total sales for a single event
```shell
Sample output:
[{
  timestamp: "2014-11-08T00:00:00.000Z",
  result: { count: 1731, item_count: 4081 }
}]
```
[/none/item_count,count/all/2014-11-08/?action=PURCHASED&event=15004D6584601432&tz=America/Los_Angeles](https://as2-mobilitus.activitystream.com/api/analytics/trades/all/none/item_count,count/all/2014-11-08/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432&tz=America/Los_Angeles&queryType=timeseries)

Setting | Value
-------- | -----------
Dimensions | `none`
Metrics | `item_count`, `count`
Ganularity | `all`
Period | from: `2014-11-08` (no to period specified)
Filter | `&action=PURCHASED` and `&event=15004D6584601432`
type | `&queryType=timeseries` (We need no grouping and then timeseries are faster)
tz | `America/Los_Angeles`

### Total sales for a single event broken down by days
```shell
Sample output:
[
  {
  timestamp: "2014-11-08T00:00:00.000Z",
  result: { count: 1181, item_count: 2853 }
  },
  {
  timestamp: "2014-11-09T00:00:00.000Z",
  result: { count: 126, item_count: 309 }
}, ...
```
[/none/item_count,count/day/2014-11-08/?action=PURCHASED&event=15004D6584601432&tz=America/Los_Angeles](https://as2-mobilitus.activitystream.com/api/analytics/trades/all/none/item_count,count/day/2014-11-08/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432&queryType=timeseries&tz=America/Los_Angeles)

Setting | Value
-------- | -----------
Dimensions | `none`
Metrics | `item_count`, `count`
Ganularity | `day`
Period | from: `2014-11-08` (no to period specified)
Filter | `&action=PURCHASED` and `&event=15004D6584601432`
type | `&queryType=timeseries` (We need no grouping and then timeseries are faster)
tz | `America/Los_Angeles`


</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>


`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/event/item_count,count,total_price/all/2014-12-06/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432`

`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/event/item_count,count,total_price/day/2014-12-06/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432`

`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/event,currency_code/item_count,count,total_price/P1W/2014-12-08/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432`

`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/currency_code/item_count,count,total_price/P1W/2014-12-08/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv`

##Artists
`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/event/item_count,count,total_price/all/2014-12-06/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432`

`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/event/item_count,count,total_price/day/2014-12-06/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432`

`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/event,currency_code/item_count,count,total_price/P1W/2014-12-08/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv&event=15004D6584601432`

`https://as2-mobilitus.activitystream.com/api/analytics/trades/all/currency_code/item_count,count,total_price/P1W/2014-12-08/?action=PURCHASED&apikey=T04VrmHjhmrhkWa4AtDv`

##Venues
##Social Media

#Reserved Queries

#Reserved Queries