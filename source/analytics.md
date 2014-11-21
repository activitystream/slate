---
title: AS Analytic Queries

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>Activity Stream API</a>
  - <a href='/provisioning.html#'>Provisioning API</a>
  - <a href='/graph.html#'>SQL Graph Queries</a>
  - Analytic Queries
  - <a href='/as-catalog.html#'>The AS Event-Type Catalog</a>
  - <a href='/recipes.html#'>Recipes</a>
  - <a href='/details.html#'>Details & references</a>
  
includes:

search: true
---

# Introduction
This documentation will help you get

#Event Analytics

#Purchasing
##Purchasing Queries
##Purchasing Streaming Analytics

#Web Analytics
##Web Analytics Queries
##Web Analytics Streaming Analytics

#AB Testing
##AB Testing Queries
##AB Testing Streaming Analytics

#Times-Series
##Time-Series Queries
##Time-Series Streaming Analytics

##Simple Timeseries Queries
`/api/analytics/timeseries/{series}>/{dimensions}[,..]/[aggr:]{metric}[,..]/{granularity}/{from}/{to}?{dimension}=<filter>[,…]&sort={metric}&limit={limit}?apikey=<api_key>`

Property | Description
-------- | -----------
{series} | The series name that you specified in the message
{dimensions} | list of dimensions to facet/group on. This is any value from the classification section. (type in the above example). Defaults to metric
{metric} | Metrics to include and the aggregation to user. Defaults to count This is any key/value from the ts_data section (importance/type in the example above)</br>Metric calculations for aggregated results:</br>sum:, min:, max:</br>Used to control the calculation done on the aggregated value (rollup on minutes/hours/days/etc.)
{granularity} | The aggregation period/duration - defaults to a day</br> Named values: "all", "none", "minute", "fifteen_minute", "thirty_minute", "hour", "day"</br>ISO 8601 Period examples: P2W = 2 Weeks, P3M = 3 Months, PT1H = 1 Hour, PT1H30M = 1 Hour and 30 minutes, PT0.750S = 750 milliseconds</br>The period specified can not be shorter than the minimum granularity of the time-series which is, by default, 1 minute in AS Analytics.</br>(Finer grained results can only be attained in the AS Event Processor for new/incoming test results).
{from} | defaults to today@midnight (see period section for fixed offsets) </br>Period example: “P-1D” can be used to start exactly 24 hours ago.
{to} | defaults to now (includes most recent data points)
{filter} | One or more dimensions/metric filter (regular expressions allowed). Results can be filtered by any dimension and one or multiple, comma separated, values. Regular expressions can also be used in filters.</br>
{sort} | sort=<metric> or for descending sort=-<metric></br>order and limit can be used to affect the results.</br>descending order: &order=-<field>
{limit} | limit=<count>   (offset/paging is still missing). Ascending order and only 5 results: &order=<field>[..]&limit=5

#RAW Queries

#Recipes