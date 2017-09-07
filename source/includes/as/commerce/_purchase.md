# Commerce

##Cart created
as.commerce.cart.created
Sent when cart creation is an explicit action.

```js
{
    "type": "as.commerce.cart.created",
    "origin": "tripcreator.web",
    "occurred_at": "2015-10-06T09:07:24.906Z",
    "involves": [
        {
            "role": "ACTOR",
            "entity": {
                "entity_ref": "Session/234243234",
                "relations": [
                    {
                        "type": "PROXY_FOR",
                        "entity_ref": "Account/4345345345"
                    }
                ]
            }
        },
        {
            "role": "AFFECTS:CREATES",
            "entity": {
                "entity_ref": "Plan/5674576457546",
                "aspects": {
                    "timed": {
                        "begins": "2015-11-24T17:00:00.000Z",
                        "ends": "2015-11-24T20:00:00.000Z",
                        "action": "valid"
                    },
                    "tags": [
                        "geothermal area",
                        "geothermal bath",
                        "hot spring",
                        "northern lights",
                        "national park",
                        "puffin",
                        "photography",
                        "seal",
                        "waterfall",
                        "ring-road highlights"
                    ],
                    "metrics": {
                        "rooms": 1.0,
                        "children": 0.0,
                        "adults": 2.0,
                        "budget_level": 3.0,
                        "budget": 230000.0
                    }
                }
            }
        }
    ],
    "aspects": {
        "client_ip": "8.8.8.8",
        "client_device": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36"
    }
}
```
###Fields

##Item Added to Cart
as.commerce.cart.item.added
Sent when item(s) are added to the cart

```js
{
    "type": "as.commerce.cart.item.added",
    "origin": "tripcreator.web",
    "occurred_at": "2015-10-06T09:07:24.907Z",
    "involves": [
        {
            "role": "ACTOR",
            "entity_ref": "Planner/12312313123"
        },
        {
            "role": "INVOLVES",
            "entity_ref": "Session/234234234234324"
        },
        {
            "role": "AFFECTS",
            "entity_ref": "Plan/45634563456435"
        }
    ],
    "aspects": {
        "items": [
            {
                "involves": [
                    {
                        "role": "TRADE:CARTED",
                        "entity": {
                            "entity_ref": "Poi/456456456456",
                            "relations": [
                                {
                                    "type": "SUPPLIED_BY",
                                    "entity_ref": "Supplier/5675657856445"
                                }
                            ],
                            "aspects": {
                                "presentation": {
                                    "label": "Reykjadalur Geothermal Area"
                                },
                                "dimensions": {
                                    "sub_category": "Geothermal Areas",
                                    "type": "To See",
                                    "category": "Nature"
                                }
                            }
                        }
                    }
                ],
                "item_count": 1,
                "aspects": {
                    "timed": {
                        "begins": "2015-11-24T17:00:00.000Z",
                        "ends": "2015-11-24T20:00:00.000Z",
                        "action": "valid"
                    }
                }
            }
        ],
        "client_ip": "8.8.8.8",
        "client_device": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36"
    },
    "_v": "java-0.2.7"
}
```

###Fields

##Item Removed from Cart
as.commerce.cart.item.removed
Sent when item(s) are removed from the cart

###Fields

##Item Changed in Cart
as.commerce.cart.item.changed
Sent when item(s) are changed in the cart

###Fields

##Purchase Starts
as.commerce.purchase.started
Sent when purchase process starts

###Fields

##Purchase Completed
as.commerce.purchase.completed

Sent when purchase process ends

###Fields
Property | Type | Description
-------- | ----------- | -----------
**type** | Fixed | **as.commerce.purchase.completed**
**origin** | String | Set to the identifier of the originating system
**occurred_at** | ISO-Date | The date+time for when purchase occurred
**[involves](/as-api.html#event-relations)** | | list of entities involved in the event and what role the played
 | ACTOR:SOLD_TO | The entity (buyer) making the purchase
 | INVOLVES:BOUGHT_FOR | The entity (recepient) who will own the purchased goods or services
 | INVOLVES:DELIVERED_TO | Location where purchase is shipped, if applicable
 | SOLD_BY | The entity (seller) who made the sale
 | CREATES | The Order created as a result of this purchase
[aspects](/as-api.html#aspects) | | The standard event aspects used for this event message
 | [items](/as-api.html#items-xcommerce) | Items that were purchased
 | [client IP](/as-api.html#client-ip) | IP address of buyer if ecommerce transaction
 | [presentation](/as-api.html#presentation) | Presentation and content information 
 | [dimensions](/as-api.html#dimensions-metricsfacts) | Additional information added for analytics processing  
properties | Map | Any other custom  properties to store with the ticket 

##Purchase Cancelled
as.commerce.purchase.cancelled

Sent when a purchase is cancelled

###Fields
Property | Type | Description
-------- | ----------- | -----------

##Payment Starts
as.commerce.payment.started
Sent when purchase process ends

###Fields

##Payment Completed
as.commerce.payment.completed
Sent when purchase process ends

###Fields

##Coupon Added
as.commerce.cart.coupon.added
Sent when coupon is added for the purchase

###Fields

##Coupon Removed
as.commerce.cart.coupon.removed
Sent when coupon is removed from the purchase

###Fields

##Item Returned
as.commerce.item.returned
Sent when item(s) are returns

###Fields

## Examples
Lets start with a small message and then continue adding information to it to make ite as complete as can be

### Smallest possible purchase message.
```json
{
  "event": "as.commerce.purchase.completed",
  "involves": [
    {"ACTOR":"Customer/1981"}
  ],
  "aspects": {
    "items": [{
      "PURCHASED":"Event/928928",
      "item_count":2,
      "item_price":34.5
    }]
  }
}
```

### With currency information
```json
{
  "event": "as.commerce.purchase.completed",
  "involves": [
    {"ACTOR":"Customer/1981"}
  ],
  "aspects": {
    "items": [{
      "PURCHASED":"Event/928928",
      "item_count":2,
      "item_price":34.5
    }],
    "locale":{
      "currency":"USD"
    }
  }
}
```

### With inventory and source information
```json
{
  "event": "as.commerce.purchase.completed",
  "source": "company.web",
  "involves": [
    {"ACTOR":"Customer/1981"}
  ],
  "aspects": {
    "items": [{
      "PURCHASED":"Event/928928",
      "item_count":2,
      "item_price":34.5,
      "total_in_stock":3500,
      "total_for_sale":15000
    }],
    "locale":{
      "currency":"USD"
    }
  }
}
```
### Composite items, fee and an invoice 
```json
{
  "event": "as.commerce.purchase.completed",
  "source": "company.web",
  "involves": [
    {"ACTOR":"Customer/1981"},
    {"CREATES":"Invoice/2342342"},
  ],
  "aspects": {
    "items": [{
      "PURCHASED":["Event/928928","Artist/29829","Venue/29829"],
      "item_count":2,
      "item_price":34.5,
      "total_in_stock":3500,
      "total_for_sale":15000,
      "fee_fixed":2.7,
      "serial_numbers":[
        "Ticket/928293829389238931",
        "Ticket/928293829389238932",
        "Ticket/928293829389238933"
      ]
    }],
    "locale":{
      "currency":"USD"
    }
  }
}
```

##Complete example
```
{
  "occurred_at": "2015-09-28T11:41:17.9900000+02:00",
  "involves": [
    {
      "ACTOR:BUYER": {
        "entity_ref": "Customer/5-1188286",
        "AKA": [
          "Phone/+47-"
        ],
        "aspects": {
          "presentation": "Gunnar Halvorsen",
          "address": {
            "address": "Granlibk 18",
            "address2": "",
            "zip_code": "4026",
            "city": "Stavanger",
            "country": "Norge"
          }
        }
      }
    },
    {
      "INVOLVES:BOUGHT_FOR": "Customer/5-1188286"
    },
    {
      "INVOLVES": "Order/5-13046892"
    }
  ],
  "origin": "billettportalen.no.direct",
  "aspects": {
    "items": [
      {
        "PURCHASED": {
          "entity_ref": "EventDate/5-33362",
          "label": "Vamp",
          "aspects": {
            "timed": {
              "begins": "2015-11-25T21:15:00.0000000+01:00"
            }
          },
          "relations": [
            {
              "PART_OF": "Event/5-10654"
            },
            {
              "SUPPLIED_BY": "Organizer/5-1225"
            },
            {
              "HOSTED_AT": {
                "entity_ref": "Hall/5-408",
                "relations": [
                  {
                    "LOCATED_AT": {
                      "entity_ref": "Venue/5-456",
                      "label": "Stavanger konserthus"
                    }
                  }
                ]
              }
            }
          ]
        },
        "involves": [
          {
            "INVOLVES": "Ticket/5-20480870"
          },
          {
            "SOLD_BY": "Reseller/5-1029"
          }
        ],
        "variant": "Ordinær",
        "item_count": 1,
        "item_price": 450,
        "valid_from": "2015-11-25T21:15:00.0000000+01:00",
        "serial_numbers": [
          "BarCode/5-11002048087020758592",
          "OrderBarCode/5-10001304689242471387"
        ],
        "description": "Vamp on 2015-11-25 21:15 (Amfi - 13/16)",
        "currency": "NOK",
        "price_category": "A",
        "dimensions": {
          "section": "Amfi",
          "delivery_type": "2",
          "event_type": "Musikk"
        },
        "properties": {
          "row": "13",
          "seat": "16"
        }
      }
    ]
  },
  "type": "as.commerce.purchase.completed"
} 
```
