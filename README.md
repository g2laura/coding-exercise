# TASKS

## Part One (Creating Offers)

* Add a maximum amount for both offer quantity and offer price 
* Change offer season to an integer
* Delete an offer
* Add a controller spec for redirecting after updating an offer
* Handle scenario when user tries to update an offer with invalid data
* Change season so that it is not editable

## Part Two (Trading)

Implement the Bid#find_match method. Rules are as follows

* You are allowed to partially match a bid
* A trade must reference the matching bid and offer
* The bid price must be equal to or grater than the offer price
* The offer and bid must have a matching Season and Grade. The Bid price must be higher than or equal to the offer.
* You must match the full offer quantity. A bid can be a partial match on quantity
* In the case of multiple matches the offer created first should be used as the match. 
* You must always match witht the highest bid
