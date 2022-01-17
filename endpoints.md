# Endpoints
<hr>

## Forecast
Request:
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-01-16T20:35:59.000-07:00",
                "sunrise": "2022-01-16T07:18:40.000-07:00",
                "sunset": "2022-01-16T17:00:24.000-07:00",
                "temperature": 31.96,
                "feels_like": 31.96,
                "humidity": 58,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "few clouds",
                "icon": "02n"
            },
            "daily_weather": [
                {
                    "date": "2022-01-16",
                    "sunrise": "2022-01-16T07:18:40.000-07:00",
                    "sunset": "2022-01-16T17:00:24.000-07:00",
                    "min_temp": 31.96,
                    "max_temp": 47.66,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-01-17",
                    "sunrise": "2022-01-17T07:18:14.000-07:00",
                    etc
                  },
                  {...} etc
                ],
            "hourly_weather": [
              {
                "time": "20:00",
                "temperature": 32.88,
                "conditions": "few clouds",
                "icon": "02n"
              },
              {
                "time": "21:00",
                "temperature": 31.96,
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
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "raw_url": "https://images.unsplash.com/photo-1511286148006-ec48824e3282?ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHwlN0IlMjJsb2NhdGlvbiUyMiUzRCUzRSUyMmRlbnZlciUyQ2NvJTIyJTdEfGVufDB8fHx8MTY0MjM4OTc5NA&ixlib=rb-1.2.1",
            "credit": {
                "photographer": "Miranda Joondeph",
                "photographer_profile_link": "https://unsplash.com/@mirandafayj",
                "source": "https://unsplash.com/"
            },
            "location": "denver,co"
        }
    }
}
```
## Users
Request:
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json
{
  "email": ""pesto@bestdogemail.com",
  "password": "mostcuddly",
  "password_confirmation": "mostcuddly"
}
```
Example Response:
```json
status: 201
body:
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "pesto@bestdogemail.com",
            "api_key": "224c6351abfdb73b03e3a39f"
        }
    }
}
```
## Sessions
Request:
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
{
  "email": "burton@email.com",
  "password": "bestnose"
}
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": "5",
        "type": "user",
        "attributes": {
            "email": "burton@email.com",
            "api_key": "d420e76bd57e343dfcdb14d2"
        }
    }
}
```
<hr>
