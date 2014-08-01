> [back to main doc](https://github.com/philetos/appointments/blob/master/doc/api/main.md)

Note: All appointment resources require authentication and the passing of a valid access key via the "token" param. You can generate the access key [here](http://appts-api.herokuapp.com).

## List Appointments

### Endpoint

* `GET /api/appointments/list`


### Parameters

Only the token field is required:


* `token` - string (generate access key [here](http://appts-api.herokuapp.com))
* `start_time_filter` - string datetime (format: yyyy-mm-ddT00:00:00.000Z)
* `end_time_filter`  - string datetime (format: yyyy-mm-ddT00:00:00.000Z)

### Response

> List All 

A `200 Ok` status will be returned including all appointment details.

Example:

```json
{
    "appointments": [
        {
            "id": 1,
            "first_name": "laurence",
            "last_name": "marcum",
            "start_time": "2013-11-01T07:00:00.000Z",
            "end_time": "2013-11-01T07:05:00.000Z"
        },
        {
            "id": 2,
            "first_name": "bayley",
            "last_name": "keller",
            "start_time": "2013-11-01T09:30:00.000Z",
            "end_time": "2013-11-01T09:35:00.000Z"
        },
        {
            "id": 3,
            "first_name": "brenda",
            "last_name": "hardy",
            "start_time": "2013-11-01T11:00:00.000Z",
            "end_time": "2013-11-01T11:05:00.000Z"
        },
    ]
}
```

> Filtered

Passing the optional `start_time_filter` or `end_time_filter`, will return a `200 Ok` status including the filtered appointment details .

Example:

```json
{
    "filter": {
        "by": "start_time",
        "param": "2013-11-01T07:00:00.000Z"
    },
    "appointments": [
        {
            "id": 1,
            "first_name": "laurence",
            "last_name": "marcum",
            "start_time": "2013-11-01T07:00:00.000Z",
            "end_time": "2013-11-01T07:05:00.000Z"
        }
    ]
}
```


### Other Endpoints

* [Create Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/create.md)
* [Update Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/update.md)
* [Delete Appointments](https://github.com/philetos/appointments/blob/master/doc/api/appointments/delete.md)