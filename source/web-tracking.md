---

title: Web Tracking

language_tabs:
  - javascript

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>Activity Stream API</a>
  - <a href='/provisioning.html#'>Provisioning API</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-catalog.html#'>AS Event Catalog</a>
  - Web Tracking

search: true
---

# Web Tracking
```javascript
// Add this snippet inside <head> 
<script>
(function(i,s,o,g,r,a,m){i['ActivitystreamAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//cdn.activitystream.com/asa.js','asa');

asa('tenantId', 'AS-123456');
asa('pageview');
</script>
```
The following events are a simplified version of the canonical Activity Stream web events, to facilitate quick and easy message sending with our 
web analytics script [asa.js](https://github.com/activitystream/asa.js). 

To get started using our script to collect analytical information from your website all you need to do is to place the javascript snippet to the right
somewhere between the \<head> and \</head> tags (**remember to replace 'AS-123456' with your tenant id from Activity Stream**).

This snippet loads the main Activity Stream analytics script in a way that does not affect your end users' experience and sends a pageview event.


##Sending events with asa.js
To send events, simply invoke the asa function with the event type as a string and the payload. Examples are provided in the javascript tab to the right.


## Type-id pairs
Some events have a type and id pair, like when describing a user identification or a product. These values can be anything you choose, but there
are two important considerations to keep in mind:

* **Every type/id pair must be unique**
* **Usage of types should be consistent** - for example, if you are using "Customer" and a numerical id, but also want to use email identification,
you should use a new type for that, e.g. "Email".  


##Customer Account Provided
```javascript
// Customer account provided:
asa('customer.account.provided',
{
    "ids": [
        {
            "type": "Email",
            "id": "some_customer@mail.com"
        }
    ]
});
```
Sent when the customer provides his user account details

###Fields 
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**ids** | | Array | List of available identifications of the web user(s) | Yes
 | type | String | Type of user identification, e.g. "Email", "Phone", "User", "Customer", etc. | Yes 
 | id | String | Unique id identifying the user | Yes


##Product Viewed
```javascript
// Product viewed: 
asa('product.viewed',
{
    "products": [
        {
            "description": "The magic flute",
            "type": "Event",
            "id": "1234",
            "product_variant": "Floor",
            "price_category": "C",
            "item_count": 1,
            "item_price": 200.0,
            "currency": "DKK",
            "categories": ["Concert", "Opera"]
        }
    ]
});
```
Sent when a product is viewed

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
[**products**](#products) | | Array | List of products being viewed | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | product_variant | String | Variant, e.g. front row seat, floor, etc. | No
 | price_category | String | Price category of item | No 
 | item_count | Number | How many items were carted | No
 | item_price | Number | Price of item | No
 | currency | String | What currency the listed price is in | No
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No

 
##Product Carted
Sent when an item is added to the cart

```javascript
// Product carted: 
asa('product.carted',
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
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
[**products**](#products) | | Array | List of products being carted | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | product_variant | String | Variant, e.g. front row seat, floor, etc. | No
 | price_category | String | Price category of item | No 
 | item_count | Number | How many items were carted | No
 | item_price | Number | Price of item | No
 | currency | String | What currency the listed price is in | No
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
 

##Product Uncarted
Sent when an item is removed from the cart

```javascript
// Product Uncarted
asa('product.uncarted',
{
    "products": [
        {
            "type": "EventDate",
            "id": "1559",
            "name": "Scuba diving school",
            "categories": ["Ware"],
            "price": 200.0,
            "item_count": 2
        }
    ]
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
[**products**](#products) | | Array | List of products being uncarted | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | product_variant | String | Variant, e.g. front row seat, floor, etc. | No
 | price_category | String | Price category of item | No 
 | item_count | Number | How many items were carted | No
 | item_price | Number | Price of item | No
 | currency | String | What currency the listed price is in | No
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
 
##Product Searched
Sent when a web user runs a search 

```javascript
// Product search
asa('product.searched',
{
    "term": "Some search/query",
    "location": "London",
    "categories": ["Concert"],
    "period_start": "2016-07-01T12:00:00.000+01:00",
    "period_end": "2016-07-08T18:00:00.000+01:00"
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ----
**term** | | String | The query made by the user | Yes 
**location** | | String | Possible location constraint of the query | No
**categories** | | Array | Any categories of what is being searched for | No 
**period_start** | | Date | ISO date representing the lower bounds of the time constraints of the query | No
**period_end** | | Date | Upper bounds of time constraints | No


##Product Availability Check
Sent when a user checks whether a product is available

```javascript
// Product availability check

asa('product.interest', 
{
    "products": [
        {
            "description": "Iceland - England",
            "type": "Football Match",
            "id": "Q-123",
            "categories": ["Sports", "Football"]
        }
    ]
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
[**products**](#products) | | Array | List of products being checked | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No


##Purchase Completed
Sent when a product is purchased

```javascript
// Purchase completed:
asa('purchase.completed', 
{
    "orders": [
        {
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
        }
    ]
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ----
**orders** | | Array | List of order information | Yes 
 | id | String | Unique identifier of order | Yes 
 | total_price | Number | Total price of order | No 
 | currency | String | Currency used for payment | No 
 | products | Array | List of [products](#products) involved in the order | Yes

##Order Delivery Selected
Sent when the user selects a type of delivery

```javascript
// Order Delivery selected:
asa('order.delivery.selected',
{
    "delivery_type": "Print at home"
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ----
**delivery_type** | | String | Type of delivery selected | Yes


##Product Unavailable
Sent when a searched or selected product is not available

```javascript
// Product unavailable:
asa('product.unavailable',
{
    "products": [ 
        {
            "type": "Event",
            "id": "1234",
            "categories": ["Comedy"],
            "item_price": 250 
        }
    ]
});
```

###Fields
Property | Attribute | Type | Description | Required
-------- | ----------- | ------ | ----------------------------------------- | ---- 
**products** | | Array | List of products unavailable | Yes
 | description | String | Short description, e.g. the name of an event | No
 | type | String | Type of product, e.g. Event, Ticket, etc. | Yes
 | id | String | Unique identifier of item | Yes
 | categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
 | currency | String | What currency the listed price is in | No


##Order Reviewed
Sent when the user reviews his order - no additional information is required to be added to these events

```javascript
// Order reviewed
asa('order.reviewed');
```


##Payment Failed
Sent when payment fails - no additional information is required to be added to these events

```javascript
// Payment failed
asa('payment.failed');
```


##Products
Below is a complete list of supported attributes for a product. For the above examples, only the most common use-case for the message being descibed is provided, 
but you are free to include any of these when sending a product in a message.

Attribute | Type | Description | Required
----------- | ------ | ----------------------------------------- | ---- 
description | String | Short description, e.g. the name of an event | No
type | String | Type of product, e.g. Event, Ticket, etc. | Yes
id | String | Unique identifier of item | Yes
product_variant | String | Variant, e.g. front row seat, floor, etc. | No
price_category | String | Price category of item | No 
item_count | Number | How many items were carted | No
item_price | Number | Price of item | No
currency | String | What currency the listed price is in | No
categories | Array | List of any categories the product belongs to, e.g. "Theater", "Comedy", "Sports" | No
commission | Number | Fixed item cost, added on top of the price | No
commission_percentage | Number | Variable item cost, added on top of the price| No
discount_percentage | Number | Discount percentage to be subracted from the total item price | No
tax_percentage | Number | Tax percentage added to the item price | No


<br/><br/><br/><br/><br/><br/><br/>