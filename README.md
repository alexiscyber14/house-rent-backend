# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

INSTRUCTIONS ON CREATING A HOUSE, DELTEIING A HOUSE, VIEWING A SPECIFIC HOUSE

  
 http://127.0.0.1:3001/api/v1/houses( create a house(post method), view all houses(get method))
Add a house json example below:
 {
   "house": {
    "name": "Catle la",
    "rental_fee": 10200,
    "location": "california gs",
    "date_built": "2003-01-01",
    "category": "Apartment",
    "description": "A cozy apartment for your family",
    "image_url": "http://example.com/image.jpg"
  }
}
View all house response example below:
[
    {
        "id": 1,
        "name": "My House",
        "location": 0,
        "rental_fee": 1000,
        "created_at": "2023-07-20T15:47:51.546Z",
        "updated_at": "2023-07-20T15:47:51.546Z",
        "date_built": "2000-01-01",
        "category": "Apartment",
        "description": "A cozy apartment",
        "image_url": "http://example.com/image.jpg",
        "user_id": 1
    },
    {
        "id": 2,
        "name": "Myae",
        "location": 0,
        "rental_fee": 102200,
        "created_at": "2023-07-20T15:49:41.878Z",
        "updated_at": "2023-07-20T15:49:41.878Z",
        "date_built": "2000-01-01",
        "category": "Apartment",
        "description": "A cozy apartment for your family",
        "image_url": "http://example.com/image.jpg",
        "user_id": 1
    },
    {
        "id": 3,
        "name": "Catle la",
        "location": 0,
        "rental_fee": 10200,
        "created_at": "2023-07-20T15:55:14.923Z",
        "updated_at": "2023-07-20T15:55:14.923Z",
        "date_built": "2003-01-01",
        "category": "Apartment",
        "description": "A cozy apartment for your family",
        "image_url": "http://example.com/image.jpg",
        "user_id": 1
    }
]

 http://127.0.0.1:3001/api/v1/houses/1 (show a specific house(get method), delete a house(delete method))
example response belows:
{
    "id": 1,
    "name": "My House",
    "location": "california",
    "rental_fee": 1000,
    "created_at": "2023-07-20T15:47:51.546Z",
    "updated_at": "2023-07-20T15:47:51.546Z",
    "date_built": "2000-01-01",
    "category": "Apartment",
    "description": "A cozy apartment",
    "image_url": "http://example.com/image.jpg",
    "user_id": 1
}


