---
title: AS Analytic Queries

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>Activity Stream API</a>
  - <a href='/provisioning.html#'>Provisioning API</a>
  - Analytic Queries
  - <a href='/as-catalog.html#'>AS Event Catalog</a>  
  - <a href='/web-analytics.html#'>Web Analytics Utility</a>

includes:

search: true
---

# Introduction
Cover:
Different analytic data sources and a collection of topic specific post aggregations and calculations
Event based analytics, Generic time-series, Custom (aspect based) analytics, Observation and system analytics.
Event messages and their analytical footprint (Why separation)
Aspects that contribute to analytic dimensions
Same basic query structure
RAW queries for full control

#Event Analytics
List of generic queries for event analytics

##Event Analytics

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)
duration | M |

#Times-Series

##Times-Series Analytic
`/api/analytics/timeseries/{series}>/{dimensions}[,..]/[aggr:]{metric}[,..]/{granularity}/{from}/{to}?{dimension}={filter}[,…]&sort={metric}&limit={limit}?apikey=<api_key>`

Property | Description
-------- | -----------
{series} | The series name that you specified in the message
{dimensions} | list of dimensions to group by. This is either the 'metric' dimension, source, related entity types or any value from the dimensions section in your [data-point message](/as-api.html#data-point-message-properties).
{metric} | Metrics to include and the aggregation to user with simple time-series this is either value or count. </br>Metric calculations for aggregated results: sum:, min:, max:
{granularity} | The aggregation period/duration - defaults to a day</br> Named values: "all", "none", "minute", "fifteen_minute", "thirty_minute", "hour", "day"</br>ISO 8601 Period examples: P2W = 2 Weeks, P3M = 3 Months, PT1H = 1 Hour, PT1H30M = 1 Hour and 30 minutes, PT0.750S = 750 milliseconds</br>The period specified can not be shorter than the minimum granularity of the time-series which is, by default, 1 minute in AS Analytics.</br>(Finer grained results can only be attained in the AS Event Processor for new/incoming test results).
{from} | defaults to today@midnight (see period section for fixed offsets) </br>Period example: “P-1D” can be used to start exactly 24 hours ago.
{to} | defaults to now (includes most recent data points)
{filter} | One or more dimensions/metric filter (regular expressions allowed). Results can be filtered by any dimension and one or multiple, comma separated, values. Regular expressions can also be used in filters.</br>
{sort} | sort=<metric> or for descending sort=-<metric></br>order and limit can be used to affect the results.</br>descending order: &order=-<field>
{limit} | limit=<count>   (offset/paging is still missing). Ascending order and only 5 results: &order=<field>[..]&limit=5

Query Type | Description
-------- | -----------


##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)

##Time-Series Streaming Analytics

#Purchasing Analytics
##Purchasing Queries
List of custom purchasing queries

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)
item_count | M |
item_price | M |
total_fee | M |
total_tax | M |
total_discount | M |
total_price | M |
duration | M |

##Purchasing Streaming Analytics

#Web Analytics

##Web Analytics Queries
List of custom queries for Web analytics

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)
duration | M |
size | M |

##Web Analytics Streaming Analytics

#AB Testing

##AB Testing Queries
List of custom queries for AB Testing analytics

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
ab_test | D |
outcome | D |
count | M | Return the number of data-point entries in the aggregated period (See above)
amount | M |
metric | M |
duration | M |
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points

##AB Testing Streaming Analytics

#CEI Analytics
##CEI Queries
List of custom queries for CEI analytics

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)
importance | M |
duration | M |

##CEI streaming analytics

#Observation Analytics
##Observation Queries
List of custom queries for Observation analytics

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)
importance | M |
duration | M |

##Observations streaming analytics

#System Analytics
##System Queries

##Dimensions & metrics fields
Property | Type | Description
-------- | ----------- | -----------
source | D | The system/server that submitted the data-points
{entity-type} | D | The entity type of entities related to the data-points
{dimension} | D | Any {key} part of the dimension aspect in the submitted data-points
value | M | The {value} part of the dimension aspect in the submitted data-points ("size:
count | M | Return the number of data-point entries in the aggregated period (See above)
amount | M |
metric | M |
duration | M |

##System streaming analytics

#RAW Queries

#Recipes

#Question & Answers