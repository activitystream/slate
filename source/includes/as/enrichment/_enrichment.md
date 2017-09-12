# Enrichment

##Weather Forceasted
as.enrichment.weather.predicted

A new weather prediction being sent to Activity Stream.

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.enrichment.weather.predicted**
**origin** | String | Set to the identifier of the originating system
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | INVOLVES | Entity that the forecast involves
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [localweather](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
properties | Map | Any other custom  properties to store 
