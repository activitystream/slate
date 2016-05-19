# Web Browsing
Activity stream tracks and services source control and development in various ways.

##Customer Account Provided
```shell
Typical customer account provided message:
{
    "type": "as.web.customer.account.provided",
    "origin": "www.activitystream.com",
    "occurred_at": "2016-04-20T12:18:15.656Z"
    "involves": [
        {
            "role": "ACTOR",
            "entity": {
                "entity_ref": "ASWebSession/5c3867bd-cf97-68d9-8edb-b086b73179e4"
                "relations": [
                    {
                        "type": "PROXY_FOR",
                        "entity": {
                            "entity_ref": "Email/stefanb@hotmail.com"
                        },
                        "aspects": {
                            "presentation": {
                                "label": "Stefan Baxter"
                            }
                        }
                    }
                ],
                "aspects": {
                    "client_ip": "127.0.0.1"
                }
            }
        }
    ]
}
```
Sent when the customer provides his user account details

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.customer.account.provided**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Order Delivery Selected
Sent when a delivery options for order have been selected

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.order.delivery.selected**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Order Reserved
Sent when an order has been temporarily reserved for a customer

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.order.reservation.started**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Order Reservation Timeout
Sent when a reservation for an order expires without purchase

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.order.reservation.timeout**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Order Reviewed
Sent when an order has been reviewed by the customer

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.order.reviewed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Pageview
Sent when a paged is viewed

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.pageviewed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Payment Completed
Sent when the payment process is successfully completed

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.payment.completed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Payment Failed
Sent when the payment process fails

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.payment.started**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Payment Started
Sent when the payment process is started

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.payment.started**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Product Viewed
```shell
A typical product-viewed message:
{
    "type": "as.web.product.viewed",
    "origin": "www.activitystream.com",
    "occurred_at": "2016-04-01T12:15:07.456Z",
    "involves": [
        {
            "role": "ACTOR",
            "entity": {
                "entity_ref": "ASWebSession/1b2f14a6-d64a-4e60-9e8d-efbda6298273"
                "relations": [
                    {
                        "type": "AKA",
                        "entity_ref": "Email/customer@email.com"
                    }
                ]
            }
        },
        {
            "role": "INVOLVES",
            "entity_ref": "Category/Concerts"
        },
        {
            "role": "VIEWED",
            "entity": {
                "entity_ref": "Product/115903",
                "aspects": {
                    "presentation": {
                        "label": "The Magic Flute"
                    }
                }
            }
        }
    ]
}
```
Sent when a product is viewed

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.product.viewed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Product Added to Cart
Sent when a product is added to cart

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.product.carted**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Product Variant Selected
Sent when a product variant is selected

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.product.variant.selected**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Product Unavailable
Sent when a searched or selected product is not available

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.product.unavailable**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event

##Purchase Started
Sent when a purchase is started

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.web.purchase.started**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR | The web user, session or browser that generated the event
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [pageview](/as-api.html#pageview) | Information regarding the page that was viewed
 | [client IP](/as-api.html#client-ip) | IP address that generated
 | [presentation](/as-api.html#presentation) | Presentation and content information
properties | Map | Any other custom  properties to store with the event






