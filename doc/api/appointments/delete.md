> [back to main doc](https://github.com/philetos/appointments/blob/master/doc/api/main.md)

Note: All appointment resources require authentication and the passing of a valid access key via the "token" param. You can generate the access key [here](http://appts-api.herokuapp.com).

## Delete an Appointment

### Endpoint

* `DELETE /api/appointments/:id`


### Parameters

The token and id fields are required:

* `token` - string (generate access key [here](http://appts-api.herokuapp.com))
* `id` - integer (passed in the url [ ie: /api/appointments/1 ])


### Response

If the appointment was deleted successfully, a `200 Ok` status will be returned including the appointment details.

Example:

```json
{
    "message": "This appointment has successfully been deleted",
    "appointment": {
        "id": 1,
        "first_name": "Patrick",
        "last_name": "Lewis",
        "start_time": "2015-11-01T07:00:00.000Z",
        "end_time": "2015-11-01T07:05:00.000Z",
        "created_at": "2014-08-01T15:43:50.871Z",
        "updated_at": "2014-08-01T16:23:08.535Z"
    }
}
```


### Other Endpoints

* [List Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/list.md)
* [Create Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/create.md)
* [Update Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/update.md)