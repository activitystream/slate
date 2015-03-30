#Entities

I need minor assistance to complete these examples

##Suppliers
```shell
{
  "entity_ref": "Supplier/e9d3b9a7-7e94-4b33-bb34-02ded3ce9265",
  "aspects": {
    "presentation":{
      "label":"<Name of supplier>",
      "details_url":"<https://www.supplier.is>",
      "thumbnail":"<http://www.tripcreator.com/images/suppliers/supplier.jpg>"
    },
    "dimensions": {
      "type":["Room & Board"]
    },
    "tags": ["friendly"]
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
aspects | Map | information formatted especially for activity stream and in accordance to the AS [Aspects]()
presentation | Aspect | The presentation aspects holds common "human readable" and presentation information [Presentation Aspect]() 
dimensions | Aspect | Additional/generic amount information for the test outcome [Dimensions Aspect]()
tags | Aspect | Additional/generic amount information for the test outcome [Tags Aspect]()
properties | JSON | Free format JSON structure with additional information taht you would like to store in Acitivy Stream.

##Accommodation
##Car
##Terminal
##Poi
##Updating Entities via messages
##Updating Entities via REST
