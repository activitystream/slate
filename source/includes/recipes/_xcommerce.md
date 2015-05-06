# xCommerce
##Purchasing
Lets start with a small message and then continue adding information to it to make ite as complete as can be
## Smallest possible purchase message.
```json
{
  "event": "as.xcommerce.purchase.completed",
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

## Purchase - With currency information
```json
{
  "event": "as.xcommerce.purchase.completed",
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

## Purchase - With inventory and source information
```json
{
  "event": "as.xcommerce.purchase.completed",
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
## Purchase - Composite items, fee and an invoice 
```json
{
  "event": "as.xcommerce.purchase.completed",
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

