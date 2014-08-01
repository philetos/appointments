## Api Documentation

### The Basics

All API requests are based off of the site root url. For staging the base URL is:

```
http://appts-api.herokuapp.com/api
```

All requests are sent and in JSON format. Use the `Accepts: application/json` header in all requests.

### Parameters

When sending parameters in `POST` requests (not `GET`s), use JSON-encoded parameters:

```json
{
  "name": "value",
  "name2": 2
}
```

### Response Codes

The follow response codes may be returned throughout the API:

* `200 OK` - Default successful response
* `201 Created` - Record successfully created
* `204 No Content` - No results were found for the given search
* `401 Unauthorized` – The credentials provided could not given access to this request
* `404 Not Found` - No API endpoint was found for the given URL
* `422 Unprocessable Entity` - There were problems with the provide parameters
* `500 Server Error` - There was a problem on the server with this request
* `503 Service Unavailable` – The server is currently unavailable for maintenance