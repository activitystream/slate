#Analytical Queries

Analytic Queries can be done using the simple query API documented here, via the RAW Query API (yet to be documented) or via R.

Please remember to use your API key (Information available in the Admin)


Here are some examples using the **simple query api**:

##General Structure
https://cooori.activitystream.com/api/analytics/events/all/**`{dimensions}`**/**`{metrics}`**/**`{granularity}`**/`{start}`/`{end}`?type=plan.created&apikey=`{your-api-key}`

##Available information
Parameter | Description
-------- | -----------
**`dimensions`** | Comma separated list of dimensions (See list of available dimensions below) 
**`metrics`** | Comma separated list of metrics (See list of available metrics below) 
**`granularity`** | The aggregation granularity to use (See information on granularity [here](/analytics.html#analytic-queries))
`start` | Date to start from (Full or partial ISO Date) 
`end` | Date to end by (Full or partial ISO Date)
filter | An optional value filter (See information on filters [here](/analytics.html#analytic-queries))
sort | An optional sort (See information on sort [here](/analytics.html#analytic-queries))
queryType | **groupBY**, topN, timeseries (See query type information [here](/analytics.html#query-types))
**your-api-key** | Please remember to use your API key (Information available in the Admin)

##study.events broken down by various things: 

###By Group
[https://cooori.activitystream.com/api/analytics/events/all/country/count/all/2015-03-20?type=plan.created](https://cooori.activitystream.com/api/analytics/events/all/country/count/all/2015-03-20?type=completed)


###Available information for plan.created (at this point)
Dimension | Description
-------- | -----------
tag | The tags assigned to the event message [Tags Aspect](/as-api.html#tags) 
country | The country that the user is from [ClientIP Aspect](/as-api.html#client-ip)  
city | The city that the user is from [ClientIP Aspect](/as-api.html#client-ip) 
adults | The number of adults [Custom from Dimension Aspect](/as-api.html#dimensions-metricsfacts) 
children | The number of children [Custom from Dimension Aspect](/as-api.html#dimensions-metricsfacts) 
rooms | The number of rooms [Custom from Dimension Aspect](/as-api.html#dimensions-metricsfacts) 
budget | The budget [Custom from Dimension Aspect](/as-api.html#dimensions-metricsfacts)
coord.geo | The geo coordinates [ClientIP Aspect](/as-api.html#client-ip)
dma | Designated Market Area [ClientIP Aspect](/as-api.html#client-ip)
dma_code | Designated Market Area Code [ClientIP Aspect](/as-api.html#client-ip)
ip | The client IP [ClientIP Aspect](/as-api.html#client-ip)
isp | The client Internet Service Provider [ClientIP Aspect](/as-api.html#client-ip) 
organization | The client Internet Organization [ClientIP Aspect](/as-api.html#client-ip)

Metric | Description
-------- | -----------
count | Number of events 

