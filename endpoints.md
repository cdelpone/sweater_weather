# Endpoints
<hr>

## Forecast
Request:
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
Example:
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
## Backgrounds
Request:
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json

Example:
```
status: 200
body:

{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
          "logo": "https://pixabay.com/static/img/logo_square.png"
        }
      }
    }
  }
}
```

## Users

Request:
`
POST /api/v1/users
`

Content-Type: application/json
Accept: application/json
`
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
`
Example:
Response:
```
status: 201
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

<hr>

## User
- POST /api/v1/users
- GET /api/v1/users/:id
- PUT /api/v1/users/:id
- PATCH  /api/v1/users/:id

#### `POST /api/v1/users`
##### Required Body Content:
- `user_id={integer}`

#### `GET /api/v1/users/1`
 ```json
 {
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "email@gmail.com",
            "name": "FirstName LastName",
            "google_id": "123456789",
            "address_line1": "123 Main Street",
            "address_line2": "",
            "address_city": "Denver",
            "address_state": "CO",
            "address_zip": "80202"
        }
    }
}
 ```

#### `PUT /api/v1/users/1` || `PATCH /api/v1/users/1`
##### Required Query Params:
- `user_id={integer}`

##### Required Body Content:
```json
{
  "address_line1": "{string}",
  "address_line2": "{string}",
  "address_city": "{string}",
  "address_state": "{string}",
  "address_zip": "{string}"
}
```

## Representatives
- GET /api/v1/users/:user_id/representatives

#### `GET /api/v1/users/1/representatives`
##### Required Query Parameters:
- `user_id={integer}`

```json
{
    "data": [
        {
            "id": "0",
            "type": "representative",
            "attributes": {
                "address_city": "Washington",
                "address_line1": "1600 Pennsylvania Avenue Northwest",
                "address_state": "DC",
                "address_zip": "20500",
                "name": "Joseph R. Biden",
                "title": "President of the United States"
            }
        },
        {
            "id": "1",
            "type": "representative",
            "attributes": {
                "address_city": "Washington",
                "address_line1": "1600 Pennsylvania Avenue Northwest",
                "address_state": "DC",
                "address_zip": "20500",
                "name": "Kamala D. Harris",
                "title": "Vice President of the United States"
            }
        },
        {
            "id": "2",
            "type": "representative",
            "attributes": {
                "address_city": "Washington",
                "address_line1": "B85",
                "address_state": "DC",
                "address_zip": "20510",
                "name": "John W. Hickenlooper",
                "title": "U.S. Senator"
            }
        }
    ]
}
```

### Letters
- POST /api/v1/letters
- GET /api/v1/users/:user_id/letters
- DELETE /api/v1/letters/:id

#### `POST /api/v1/letters`
##### Required Body Content:
```json
{
  "to_address_line1": "{string}",
  "to_address_line2": "{string}",
  "to_address_city": "{string}",
  "to_address_state": "{string}",
  "to_address_zip": "{string}",
  "from_address_line1": "{string}",
  "from_address_line2": "{string}",
  "from_address_city": "{string}",
  "from_address_state": "{string}",
  "from_address_zip": "{string}",
  "body": "{string}",
  "user_id": "{integer}",
  "to_name": "{string}",
  "from_name": "{string}"
}
```

#### `GET /api/v1/users/1/letters`
##### Required Query Parameters:
- `user_id={integer}`

```json
{
   "data": [
       {
           "id": "5",
           "type": "letter",
           "attributes": {
               "send_date": nil,
               "delivery_date": nil,
               "to_address_line1": "40 Massachusetts Ave NE",
               "to_address_line2": nil,
               "to_address_city": "Washington",
               "to_address_state": "DC",
               "to_address_zip": "20002",
               "from_address_line1": "11913 Freedom Dr",
               "from_address_line2": "#35",
               "from_address_city": "Reston",
               "from_address_state": "VA",
               "from_address_zip": "20190",
               "body": "Quam asperiores provident. Iure blanditiis unde. Pariatur et accusantium.",
               "user_id": 10,
               "to_name": "Britteny Jacobson",
               "from_name": "Novella Hauck MD",
               "preview_url": nil
               }
             },
       {
           "id": "6",
           "type": "letter",
           "attributes": {
               "send_date": nil,
               "delivery_date": nil,
               "to_address_line1": "40 Massachusetts Ave NE",
               "to_address_line2": nil,
               "to_address_city": "Washington",
               "to_address_state": "DC",
               "to_address_zip": "20002",
               "from_address_line1": "11913 Freedom Dr",
               "from_address_line2": "#35",
               "from_address_city": "Reston",
               "from_address_state": "VA",
               "from_address_zip": "20190",
               "body":"Et aut dolor. Consequatur dolores dolorem. Laudantium et voluptatibus.",
               "user_id": 10,
               "to_name": "Burl Tremblay",
               "from_name": "Raguel Hamill",
               "preview_url": nil
               }
            }
        ]
}
 ```
#### `DELETE /api/v1/letters/1`
##### Required Query Parameters:
- `letter_id={integer}`

```json
{
  "status": 204,
}
```
