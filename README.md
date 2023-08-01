<div align="center">
  <h3><b>House Rental API Documentation</b></h3>
</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Catalog of my things ](#-catalog-of-my-things-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Dependencies](#dependencies)
    - [Usage](#usage)
  - [API Documentation](#api-documentation)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Greeting Rails <a name="about-project"></a>

The House Rental API is a web service that enables users to rent houses and manage reservations for those houses. It provides a secure and efficient platform for users to create accounts, log in, view available houses, make reservations, and manage their bookings. The API is designed to be easy to integrate with various front-end applications and offers robust authentication using JSON Web Tokens (JWTs) to ensure data security.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby (v3.2.2)</a></li>
    <li><a href="https://rubyonrails.org/">Ruby on Rails (v7.0.5)</a></li>
  </ul>
</details>
<details>
  <summary>Database</summary>
  <ul>
    <li><a href="https://postgresql.org">PostgreSQL</a></li>
  </ul></details>

### Key Features <a name="key-features"></a>

- User Registration: Users can create new accounts by providing their email and password.

- User Authentication: Users can log in securely using their registered credentials and obtain JWT tokens for authenticated access to protected endpoints.

- House Listing: The API allows users to view a list of available houses, including their names, rental fees, and locations.

- House Details: Users can access detailed information about individual houses, such as images, descriptions, and amenities.

- Reservation Management: Users can create, view, and cancel their reservations for specific houses based on desired dates and locations.

- Data Protection: The API employs industry-standard security measures, including JWT-based authentication, to safeguard user data and ensure privacy.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

> To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

1. Ruby installed on your machine
2. Text editor (VSCode, Sublime, Atom, etc.)
3. Install Rails gem.
4. PostgreSQL running on your machine

### Setup

Clone this [repository](https://github.com/alexiscyber14/house-rent-backend.git) to your desired folder:

```sh
  git clone https://github.com/alexiscyber14/house-rent-backend.git
  cd Greeting-Rails
```

### Dependencies

Install Dependencies with:

```sh
  bundle install
```

create database in your postgresql with:

```sh
  rails db:create
```

> Note: If you have any problem with the database, you can check the database.yml file and change the username and password to your own.

Run migration with:

```sh
  rails db:migrate
```

### Usage

Run Project with:

```sh
  rails server
```

### Run tests

Run tests with:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<a href="#api-documention">API Documentation</a>

## API DOCUMENTATION

If you want to test with admin, you can use the info from the seeds.rb. The data from the seeds.rb file was already created on the server. If you want to test with localhost, you should run rails db:seed first before running the server.

- User Registration:
  To create a new user account, make a POST request to /sign_up. Include the user details (name, email, password, password_confirmation) in the request body as a JSON object.

- User Login:
  To authenticate and obtain a JWT token, make a POST request to /sign_in. Include the user credentials (email, password) in the request body as a JSON object. The API will respond with the JWT token that you can use for authenticated requests.

- User Logout:
  To log out, make a DELETE request to /sign_out.

- List All Houses:
  To retrieve a list of all houses, make a GET request to /api/v1/houses. The API will respond with a JSON array containing house details (name, rental_fee, location) for each available house.

- Show House Details:
  To view details of a specific house, make a GET request to /api/v1/houses/:id. Replace :id with the ID of the house you want to view. The API will respond with a JSON object containing detailed information about the house.

- Create a New House:
  To add a new house, make a POST request to /api/v1/houses?user_id=:user_id . Replace :user_id with the ID of the user which you want to use to create a house. And that creator needs to be an admin. Include the house details (name, rental_fee, location,date_built, category, description, image_url) in the request body as a JSON object. The API will respond with the newly created house details.

- Delete a House:
  To delete a specific house, make a DELETE request to /api/v1/houses/:id?user_id=:user_id. Replace :user_id with the ID of the user which you want to use to delete a house. And that user needs to be an admin. Replace :id with the ID of the house you want to delete. The API will delete the house and respond with a success message.

- List User Reservations:
  To view all reservations made by the logged-in user, make a GET request to /api/v1/reservations. The API will respond with a JSON array containing reservation details for the user's bookings.

- Show Reservation Details:
  To view details of a specific reservation, make a GET request to /api/v1/houses/:house_id/reservations/:id. Replace :house_id with the ID of the house associated with the reservation, and :id with the ID of the reservation you want to view. The API will respond with a JSON object containing detailed information about the reservation.

- Create a New Reservation:
  To make a reservation for a specific house, make a POST request to /api/v1/houses/:house_id/reservations. Include the reservation details (reservation_date, city) in the request body as a JSON object. The API will respond with the newly created reservation details.

- Delete a Reservation:
  To cancel a specific reservation, make a DELETE request to /api/v1/houses/:house_id/reservations/:id. Replace :house_id with the ID of the house associated with the reservation, and :id with the ID of the reservation you want to cancel. The API will delete the reservation and respond with a success message.

<br>

## Api examples examples below

**/sign_up (create a user(post method))**

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

<br>
<br>

**/sign_in (sign_in a user(post method))**

- Example below:

```sh
{
  "user": {
    "name": "yosebbaf",
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

<br/>
<br/>

**/sign_out (sign_out a user(delete method))**

- Example below:

```sh
{
  "user": {
    "name": "yosebbaf",
    "password": "password12345"
  }
}
```

- Response below:

```sh
  {
    "message": "Logged out successfully."
  }
```

<br/>
<br/>

**/member-data (access member data(get method))**

- Member data can only be accessible to signed in users,

```sh
  {
    "message": "success",
    "user": {
        "id": 1,
        "name": "grace",
        "email": "grace@example.com",
        "created_at": "2023-07-21T13:03:10.999Z",
        "updated_at": "2023-07-21T13:03:10.999Z",
        "role": "user"
    }
  }

```

**/members (access members' data(get method))**

- All Member data can only be accessible to admin

```sh
  [
    {
        "id": 1,
        "name": "grace",
        "email": "grace@example.com",
        "created_at": "2023-07-21T13:03:10.999Z",
        "updated_at": "2023-07-21T13:03:10.999Z",
        "role": "user"
    },
    {
        "id": 2,
        "name": "htet",
        "email": "htet@example.com",
        "created_at": "2023-07-21T13:37:56.250Z",
        "updated_at": "2023-07-21T13:37:56.250Z",
        "role": "admin"
    }
]

```

**/api/v1/houses?user_id=1( create a house(post method), view all houses(get method))**

- Add a house json example below:

```sh
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

```

**/api/v1/houses (view all houses(get method))**

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

<br>
<br>

**/api/v1/houses/1?user_id=1 (show a specific house(get method), delete a house(delete method))**

- Example response belows:

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
    "image_url": "http://example.com/image.jpg"
}
```

- On delete;

```sh{
    "message": "House was successfully deleted."
}
```

<br>
<br>

**/api/v1/houses/3/reservations (add a reservation(post method), view user reservations(get method))**

- Add a reservation example below:

```sh
{
  "reservation": {
    "reservation_date": "2023-08-15",
    "city": "New York City"
  }
}
```

<br>
<br>

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

<br>
<br>

**/api/v1/houses/3/reservations/2 [/api/v1/houses/:house_id/reservations/:id] (cancele reservation(delete method))**

<br>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Alexander Ssenyondo**

- GitHub: [@alexiscyber14](https://github.com/alexiscyber14)
- Instagram:[@Alexiscyber14](https://www.instagram.com/alexiscyber14/)
- LinkedIn:[@Alex_Ssenyoondo](https://www.linkedin.com/in/alex-software/)
- wellfound:[@alexiscyber14](https://angel.co/u/alexander-senyondo)

### 👤 **Grace Htet**:

- GitHub: [Grace Htet](https://github.com/GraceHtet)
- LinkedIn: [Grace Htet](https://linkedin.com/in/thirihtethtetaung)
- Twitter: [Grace Htet](https://twitter.com/Grace_Htet4)
- Angelist: [Grace Htet](https://wellfound.com/u/thiri-htet)

### 👤 **Hyder**:

- GitHub: [Hyder](https://github.com/codeWithHyder)
- LinkedIn: [Hyder](https://www.linkedin.com/in/ghulam-hyder-dar)

### 👤 **Walid Kabboussa**:

- GitHub: [Walid Kabboussa](https://github.com/Hisoka37)
- LinkedIn: [Walid Kabboussa](https://www.linkedin.com/in/walidkb/)

### 👤 **Yosefgeda**:

- GitHub: [Yosefgeda](https://github.com/Yosefgeda)
- LinkedIn: [Yosefgeda](https://www.linkedin.com/in/yosefgeda)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- House Search and Filters: Implement advanced search and filtering options to allow users to find houses based on specific criteria such as location, rental fee range, number of bedrooms, amenities, and availability.

- House Ratings and Reviews: Enable users to leave ratings and reviews for houses they have rented, helping others make informed decisions based on previous guests' experiences.

- House Booking Calendar: Introduce a calendar view that displays the availability of houses, allowing users to see which dates are already booked and which dates are open for reservations.

- House Recommendations: Implement a recommendation system that suggests houses to users based on their previous rentals, preferences, and search history.

- User Profiles: Allow users to create and manage their profiles, including personal information, preferences, and past rental history.

- House Owner Dashboard: Provide house owners with a dashboard to manage their properties, view rental analytics, and respond to guest inquiries.

- Real-Time Notifications: Implement real-time notifications to alert users about reservation confirmations, cancellations, or other important updates.

- Payment Integration: Integrate a secure payment gateway to facilitate online payments for reservations, making the booking process seamless and convenient.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/alexiscyber14/ror-react/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, please leave a ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I thank Microverse for making this project possible.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
