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


 http://127.0.0.1:3001/sign_up (create a user(post method))
- Example below:
```sh
{
  "user": {
    "name":"yosebbaf",
    "email": "newssur@example.com",
    "password": "password5050",
    "password_confirmation": "password5050"
  }
}
```
- Response below:
```sh
{
    "message": "success",
    "data": {
        "id": 4,
        "email": "newssur@example.com",
        "name": "yosebbaf",
        "role": "user"
    }
}
```



http://127.0.0.1:3001/sign_in (sign_in a user(post method))

- Example below: 
```sh{
  "user": {
    "email": "newur@example.com",
    "password": "password12345"
  }
}
```
- Response below:
```sh 
  {
    "message": "Logged in successfully.",
    "data": {
        "user": {
            "id": 3,
            "name": "yosef",
            "email": "newur@example.com",
            "created_at": "2023-07-20T19:21:11.485Z",
            "updated_at": "2023-07-20T19:21:11.485Z",
            "role": "user"
        }
    }
   }
```


http://127.0.0.1:3001/api/v1/houses( create a house(post method), view all houses(get method))
- Add a house json example below:
```sh {
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
```
- View all house response example below:

```sh
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
```
 http://127.0.0.1:3001/api/v1/houses/1 (show a specific house(get method), delete a house(delete method))
Example response belows:
```sh{
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
```
- On delete;
```sh{
    "message": "House was successfully deleted."
}
```


 http://127.0.0.1:3001/api/v1/houses/3/reservations (add a reservation(post method), view user reservations(get method))
- Add a reservation example below: 
```sh
{
  "reservation": {
    "reservation_date": "2023-08-15",
    "city": "New York City"
  }
}
```

**/api/v1/reservations (list all the reservations of the logged in user(get method))**

- Responese example below:
```sh
[
    {
        "id": 1,
        "user_id": 2,
        "house_id": 4,
        "city": "New York City",
        "reservation_date": "2023-08-15T00:00:00.000Z",
        "created_at": "2023-07-20T18:39:04.572Z",
        "updated_at": "2023-07-20T18:39:04.572Z"
    },
    {
        "id": 2,
        "user_id": 2,
        "house_id": 3,
        "city": "New York City",
        "reservation_date": "2023-08-15T00:00:00.000Z",
        "created_at": "2023-07-20T18:40:32.048Z",
        "updated_at": "2023-07-20T18:40:32.048Z"
    },
    {
        "id": 3,
        "user_id": 2,
        "house_id": 4,
        "city": "chicago",
        "reservation_date": "2023-08-15T00:00:00.000Z",
        "created_at": "2023-07-20T18:55:57.964Z",
        "updated_at": "2023-07-20T18:55:57.964Z"
    }
]
```
 http://127.0.0.1:3001/api/v1/houses/3/reservations/2 [/api/v1/houses/:house_id/reservations/:id] (cancele reservation(delete method))

