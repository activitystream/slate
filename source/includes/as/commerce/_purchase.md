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

