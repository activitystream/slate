---

title: Web Events

language_tabs:
  - javascript

toc_footers:
  - <h3>Documentation Index</h3>
  - Activity Stream API
  - <a href='/provisioning.html#'>Provisioning API</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-catalog.html#'>AS Event Catalog</a>
  - <a href='/web-catalog.html#'>Web-Event Catalog</a>

search: true
---

# Web Events
The following events are a simplified version of the canonical Activity Stream web events. 

##User Identified
```javascript
// Customer account provided:
{
    "user": [ 
        {
            "type": "Email",
            "id": "some_customer@mail.com"
        }
    ]
}
```
Sent when the customer provides his user account details

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**user** | | Array | List of available information about the web user(s) | Yes
 | device_id | String | Unique identifier for the visitor/browser | No *
 | session | String | Session id | No *
 | type | String | Type of user identification, e.g. "Email", "Phone", etc. | Yes
 | id | String | Unique id identifying the user | Yes

* These attributes are supplied automatically by asa.js and are always a part of every web event. Therefore they are not required, 
but can be overridden if needed.

##Product Viewed
```javascript
// Product viewed: 
{
    "product": {
        "description": "The magic flute",
        "type": "Event",
        "id": "1234",
        "product_variant": "Floor",
        "price_category": "C",
        "item_price": 200.0,
        "currency": "DKK",
        "categories": ["Concert", "Opera"]
    }
}
```
Sent when a product is viewed

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**products** | | Array | List of products being viewed | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | product_variant | String | Variant, e.g. front row seat, floor, etc. | No
 | price_category | String | Price category of item | No 
 | item_price | Number | Price of item | No
 | currency | String | What currency the listed price is in | No
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No

 
##Product Carted
Sent when an item is added to the cart

```javascript
// Product carted: 
{
    "products": [ 
        {
            "type": "Event",
            "id": "1234",
            "categories": ["Comedy"],
            "item_count": 1,
            "item_price": 250 
        }
    ]
}
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**products** | | Array | List of products being carted | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
 | item_count | Number | How many items were carted | No
 | item_price | Number | Price of item added | No
 | currency | String | What currency the listed price is in | No
 

##Product Uncarted
Sent when an item is removed from the cart

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**products** | | Array | List of products being carted | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
 | item_count | Number | How many items were carted | No
 | currency | String | What currency the listed price is in | No
 
##Product search
Sent when a web user runs a search 

```javascript
// Product search
{
    "term": "Some search/query",
    "location": "London",
    "categories": ["Concert"],
    "period_start": "2016-07-01T12:00:00.000+01:00",
    "period_end": "2016-07-08T18:00:00.000+01:00"
}
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ----
**term** | | String | The query made by the user | Yes 
**location** | | String | Possible location constraint of the query | No
**categories** | | Array | Any categories of what is being searched for | No 
**period_start** | | Date | ISO date representing the lower bounds of the time constraints of the query | No
**period_end** | | Date | Upper bounds of time constraints | No

##Product purchased
Sent when a product is purchased

```javascript
// Product purchased: 
{
    "orders": [
        "id": "1234",
        "total_price": 125.25,
        "currency": "USD",
        "products": [
            {
                "description": "Some event",
                "type": "EventDate",
                "id": "5678",
                "categories": ["Ticket"],
                "item_count": 2,
                "item_price": 50
            }
        ]
    ]
}
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ----
**orders** | | Array | List of order information | Yes 
 | id | String | Unique identifier of order | Yes 
 | total_price | Number | Total price of order | No 
 | currency | String | Currency used for payment | No 
 | products | Array | List of products involved in the order | No

##Delivery Selected
Sent when the user selects a type of delivery

```javascript
// Delivery selected:
{
    "delivery_type": "Print at home"
}
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ----
**delivery_type** | | String | Type of delivery selected | Yes


##Product unavailable
Sent when a searched or selected product is not available

```javascript
// Product unavailable:
{
    "products": [ 
        {
            "type": "Event",
            "id": "1234",
            "categories": ["Comedy"],
            "item_price": 250 
        }
    ]
}
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**products** | | Array | List of products being carted | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
 | currency | String | What currency the listed price is in | No


##Order Overviewed
Sent when the user reviews his order - no additional information is required to be added to these events


##Payment Failed
Sent when payment fails - no additional information is required to be added to these events

