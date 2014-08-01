> [back to main doc](https://github.com/philetos/appointments/blob/master/doc/api/main.md)

Note: All appointment resources require authentication and the passing of a valid access key via the "token" param. You can generate the access key [here](http://appts-api.herokuapp.com).

## Create an Appointment

### Endpoint

* `POST /api/appointments`


### Parameters

Only the comments field is optional:


* `token` - string (generate access key [here](http://appts-api.herokuapp.com))
* `first_name` - string
* `last_name` - string
* `start_time` - datetime (format: yyyy-mm-ddT00:00:00.000Z)
* `end_time` - datetime (format: yyyy-mm-ddT00:00:00.000Z)
* `comments` - string

### Response

> Successful

If the appointment was created successfully, a `201 Created` status will be returned including the appointment details.

Example:

```json
{
    "message": "This appointment has successfully been created",
    "appointment": {
        "id": 2475,
        "first_name": "patrick",
        "last_name": "lewis",
        "start_time": "2014-11-01T07:00:00.000Z",
        "end_time": "2014-11-01T07:30:00.000Z",
        "created_at": "2014-08-01T04:27:23.671Z",
        "updated_at": "2014-08-01T04:27:23.671Z"
    }
}
```
> Unsuccessful

If the appointment could not be created, a `422 Unprocessable Entity` status will be returned and any found errors will be returned in the JSON message.

Examples:

```json
{
    "message": "Unable to create this appointment",
    "errors": {
        "start_time": [
            "can't be blank"
        ],
        "end_time": [
            "can't be blank"
        ],
        "first_name": [
            "can't be blank"
        ],
        "last_name": [
            "can't be blank"
        ]
    }
}
```

```json
{
    "message": "Unable to create this appointment",
    "errors": {
        "appointment_time": [
            "overlaps an existing appointment",
            "must be set in the future"
        ]
    }
}
```

### Other Endpoints

* [List Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/list.md)
* [Update Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/update.md)
* [Delete Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/delete.md)