## Appointments Api Documentation

### The Basics

All API requests are based off of the base URL below:

```
http://appts-api.herokuapp.com/api
```

All requests are sent and in JSON format.

### Access Key

Note: All appointment resources require authentication and the passing a valid access key via the "token" param. You can generate the access key [here](http://appts-api.herokuapp.com).


Resources that require authentication will return a `401 Unauthorized` status code if no valid token is provided.

### Response Codes

The follow response codes may be returned throughout the API:

* `200 OK` - Default successful response
* `201 Created` - Record successfully created
* `401 Unauthorized` – The credentials provided could not given access to this request
* `404 Not Found` - No API endpoint was found for the given URL
* `422 Unprocessable Entity` - There were problems with the provide parameters

### Endpoints

* [List Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/list.md)
* [Create Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/create.md)
* [Update Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/update.md)
* [Delete Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/delete.md)