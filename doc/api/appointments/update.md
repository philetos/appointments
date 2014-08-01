> [back to main doc](https://github.com/philetos/appointments/blob/master/doc/api/main.md)

Note: All appointment resources require authentication and the passing of a valid access key via the "token" param. You can generate the access key [here](http://appts-api.herokuapp.com).

## Update an Appointment

### Endpoint

* `PATCH /api/appointments/:id`


### Parameters

Only the token and id fields are required:

* `token` - string (generate access key [here](http://appts-api.herokuapp.com))
* `id` - integer (passed in the url [ ie: /api/appointments/1 ])
* `first_name` - string
* `last_name` - string
* `start_time` - datetime (format: yyyy-mm-ddT00:00:00.000Z)
* `end_time` - datetime (format: yyyy-mm-ddT00:00:00.000Z)
* `comments` - string

### Response

> Successful 

If the appointment was updated successfully, a `201 Created` status will be returned including the appointment details.

Example:

```json
{
    "message": "This appointment has successfully been updated",
    "appointment": {
        "id": 1,
        "first_name": "Patrick",
        "last_name": "marcum",
        "start_time": "2015-11-01T07:00:00.000Z",
        "end_time": "2015-11-01T07:05:00.000Z",
        "created_at": "2014-08-01T15:43:50.871Z",
        "updated_at": "2014-08-01T16:23:08.535Z"
    }
}
```

> Unsuccessful

If the appointment could not be updated, a `422 Unprocessable Entity` status will be returned and any found errors will be returned in the JSON message.

Example:

```json
{
    "message": "Unable to update this appointment",
    "errors": {
        "appointment_time": [
            "must be set in the future"
        ]
    },
    "appointment": {
        "id": 1,
        "start_time": "2013-11-01T07:00:00.000Z",
        "end_time": "2013-11-01T07:05:00.000Z",
        "first_name": "laurence",
        "last_name": "marcum",
        "comments": null,
        "created_at": "2014-08-01T15:43:50.871Z",
        "updated_at": "2014-08-01T15:43:50.871Z"
    }
}
```


### Other Endpoints

* [List Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/list.md)
* [Create Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/create.md)
* [Delete Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/delete.md)