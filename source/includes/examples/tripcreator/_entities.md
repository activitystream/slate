#Entities

I need minor assistance to complete these examples

##Suppliers
```shell
Entity messages can be sent via message queue or via REST API (See below) 
{
  "entity_ref": "Supplier/e9d3b9a7-7e94-4b33-bb34-02ded3ce9265",
  "aspects": {
    "presentation":{
      "label":"<Name of supplier>",
      "details_url":"<https://www.supplier.is>",
      "thumbnail":"<http://www.tripcreator.com/images/suppliers/supplier.jpg>"
    },
    "dimensions": {
      "type":["<Room & Board>"]
    },
    "tags": ["<friendly>"]
  }
  "properties": {
    "something":true,
    "anything":{"you":["might","want"]},
    "everything":"almost"
  }
}
```

###Reccomended Supplier Structure

Field | Type | Description
----- | ---- | -----------
**entity_ref** | entity_ref | <Entity_Type>/<Entity_ID> where Entity_ID is the foreign key in your model and Entity_Type is, most often, your Table name
aspects | Map | information formatted especially for activity stream and in accordance to the AS [Aspects](/as-api.html#aspects)
presentation | Aspect | The presentation aspects holds common "human readable" and presentation information [Presentation Aspect](/as-api.html#presentation) 
dimensions | Aspect | Additional/generic amount information for the test outcome [Dimensions Aspect](/as-api.html#dimensions-metricsfacts)
tags | Aspect | Additional/generic amount information for the test outcome [Tags Aspect](/as-api.html#tags)
properties | JSON | Free format JSON structure with additional information taht you would like to store in Activity Stream.

**Available Aspects:** [`Attachments`](/as-api.html#attachments), [`Classification`](/as-api.html#classification), [`Dimensions`](/as-api.html#dimensions), [`Demography`](/as-api.html#demography), [`GEO Location`](/as-api.html#geo-locations),  [`Presentation`](/as-api.html#presentation), [`Summary`](/as-api.html#summary), [`Tags`](/as-api.html#tags)

##Accommodation
```shell

{
  "entity_ref": "Accommodation/7d673b72-cc6c-4f27-ac42-f0935af0c8a5",
  "aspects": {
    "presentation":{
      "label":"<Name of accommodation>",
      "details_url":"<https://www.accommodation.is>",
      "thumbnail":"<http://www.tripcreator.com/images/accommodation/accommodation.jpg>"
    },
    "dimensions": {
      "type":["<Hotel>"],
      "rating":3.5
      
    },
    "tags": ["<farmers>"]
  }
  "properties": {
    "something":true,
    "anything":{"you":["might","want"]},
    "everything":"almost"
  }
}
```

Field | Type | Description
----- | ---- | -----------
**entity_ref** | entity_ref | <Entity_Type>/<Entity_ID> where Entity_ID is the foreign key in your model and Entity_Type is, most often, your Table name
aspects | Map | information formatted especially for activity stream and in accordance to the AS [Aspects](/as-api.html#aspects)
presentation | Aspect | The presentation aspects holds common "human readable" and presentation information [Presentation Aspect](/as-api.html#presentation) 
dimensions | Aspect | Additional/generic amount information for the test outcome [Dimensions Aspect](/as-api.html#dimensions-metricsfacts)
geo_location | Aspect | Geo location of the hotel [GeoLocation Aspect](/as-api.html#geo-locations)
tags | Aspect | Additional/generic amount information for the test outcome [Tags Aspect](/as-api.html#tags)
properties | JSON | Free format JSON structure with additional information taht you would like to store in Activity Stream.

**Available Aspects:** [`Attachments`](/as-api.html#attachments), [`Classification`](/as-api.html#classification), [`Dimensions`](/as-api.html#dimensions), [`Demography`](/as-api.html#demography), [`GEO Location`](/as-api.html#geo-locations),  [`Presentation`](/as-api.html#presentation), [`Summary`](/as-api.html#summary), [`Tags`](/as-api.html#tags)


##Car
##Terminal
##Poi
##Updating Entities via messages
##Updating Entities via REST
