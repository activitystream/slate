# Commerce

##Item Added
as.commerce.cart.item.added
Sent when item(s) are added to the cart

###Fields

##Item Removed
as.commerce.cart.item.removed
Sent when item(s) are removed from the cart

###Fields

##Item Changed
as.commerce.cart.item.updated
Sent when item(s) are changed in the cart

###Fields

##Purchase Starts
as.commerce.cart.purchase.starts
Sent when purchase process starts

###Fields

##Purchase Completed
as.commerce.cart.purchase.ends
Sent when purchase process ends

###Fields

##Payment Starts
as.commerce.cart.payment.starts
Sent when purchase process ends

###Fields

##Payment Completed
as.commerce.cart.payment.ends
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
            "CREATES": "Ticket/5-20480870"
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
          "delivery_type": 2,
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