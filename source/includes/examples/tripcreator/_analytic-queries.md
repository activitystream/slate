#Analytical Queries

Analytic Queries can be done using the simple query API documented here, via the RAW Query API (yet to be documented) or via R.

Please remember to use your API key (Information available in the Admin)


Here are some examples using the **simple query api**:

##General Structure
https://tripcreator.activitystream.com/api/analytics/events/all/**`{dimensions}`**/**`{metrics}`**/**`{granularity}`**/`{start}`/`{end}`?type=plan.created&apikey=`{your-api-key}`

##Available information
Parameter | Description
-------- | -----------
**`dimensions`** | Comma separated list of dimensions (See list of available dimensions below) 
**`metrics`** | Comma separated list of metrics (See list of available metrics below) 
**`granularity`** | The aggregation granularity to use (See information on granularity [here](/analytics.html#time-series-queries))
`start` | Date to start from (Full or partial ISO Date) 
`end` | Date to end by (Full or partial ISO Date)
`filter` | An optional value filter (See information on filters [here](/analytics.html#time-series-queries))
`sort` | An optional sort (See information on sort [here](/analytics.html#time-series-queries))
**`your-api-key`** | Please remember to use your API key (Information available in the Admin)

##plan.created Events broken down by various things: 

###By country
[https://tripcreator.activitystream.com/api/analytics/events/all/country/count/all/2015-03-20?type=plan.created](https://tripcreator.activitystream.com/api/analytics/events/all/country/count/all/2015-03-20?type=plan.created)

###By country and city
[https://tripcreator.activitystream.com/api/analytics/events/all/country,city/count/all/2015-03-20?type=plan.created](https://tripcreator.activitystream.com/api/analytics/events/all/country,city/count/all/2015-03-20?type=plan.created)

###By country broken down by days
[https://tripcreator.activitystream.com/api/analytics/events/all/country/count/day/2015-03-20?type=plan.created](https://tripcreator.activitystream.com/api/analytics/events/all/country/count/day/2015-03-20?type=plan.created)

###By country and city broken down by days
[https://tripcreator.activitystream.com/api/analytics/events/all/country,city/count/day/2015-03-20?type=plan.created](https://tripcreator.activitystream.com/api/analytics/events/all/country,city/count/day/2015-03-20?type=plan.created)

###Tags All
[https://tripcreator.activitystream.com/api/analytics/events/all/tags/count/all/2015-03-20?type=plan.created](https://tripcreator.activitystream.com/api/analytics/events/all/tags/count/all/2015-03-20?type=plan.created)

###Top 10 Tags per day (select the whole month)
[https://tripcreator.activitystream.com/api/analytics/events/all/tags/count/day/2015-03?type=plan.created&queryType=topN](https://tripcreator.activitystream.com/api/analytics/events/all/tags/count/day/2015-03-20?type=plan.created&queryType=topN)

###Top 5 Tags per day (select the whole month)
[https://tripcreator.activitystream.com/api/analytics/events/all/tags/count/day/2015-03?type=plan.created&queryType=topN&limit=5](https://tripcreator.activitystream.com/api/analytics/events/all/tags/count/day/2015-03-20?type=plan.created&queryType=topN&limit=5)


###Available information for plan.created (at this point)
Dimension | Description
-------- | -----------
tag | 
country | 
city | 
isp | 
isp |
adults | 
children | 
rooms | 
budget |
coord.geo |
dma |
dma_code |


Metric | Description
-------- | -----------
count | 

