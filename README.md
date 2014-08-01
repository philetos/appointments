# Project: Appointments Api

> A database-driven RESTful web API for managing appointment 
resources

## Dependencies

> Note: This project is running edge Rails and other pre-release gems. You may need to upgrade your dependencies often.

* Bundler (1.5.3)
* Rails (4.1.4)
* Ruby (2.0.0)
* [PostgreSQL](http://www.postgresql.org/)

## Setup

To run the app..

1. Clone this repo
2. Install non-gem dependencies above
3. Install gems with `bundle install`
4. Run `rake setup` to setup database, migrate, populate seeds, and import data.


## [API Documentation](https://github.com/philetos/appointments/blob/master/doc/api/main.md)

### The Basics

All API requests are based off of the site root url. For staging the base URL is:

```
http://api.redmangousa.com/api
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

### Hypermedia

All resources may have one or more `*_url` properties linking to other resources. All main endpoints have a reference in the API root at `/api`.

### HTTP Request Types

All resources are available as `GET` requests, unless otherwise noted. For any non-standard request types, such as `PUT`, `PATCH` and `DELETE`, the `_method` parameter can be used instead with a standard `POST` request.

For example, to make a `DELETE` request, you could also do a `POST` with the following parameters:

```json
{
  "_method": "DELETE"
}
```

### Authentication

All resources that require authentication should use the `X-Auth-Token` header. The token to use as the value of this header is provided in the [sign-in resource](https://github.com/ovenbits/red-mango/blob/master/doc/api/account.md#sign-in) body.

Here is a sample request header for an authenticated request:

```
Accept-Language: en-us
Accept: application/json
X-Auth-Token: bcd88effbe5a41130f8799a58fb40407deee37a
Accept-Encoding: gzip, deflate
```

Resources that require authentication will return a `401 Unauthorized` status code if no valid user token is provided.

### Endpoints

* [Stores](https://github.com/ovenbits/red-mango/blob/master/doc/api/stores.md)
* [Menu](https://github.com/ovenbits/red-mango/blob/master/doc/api/menu.md)
* [Flavors](https://github.com/ovenbits/red-mango/blob/master/doc/api/flavors.md)
* [User Account](https://github.com/ovenbits/red-mango/blob/master/doc/api/account.md)
* [Favorites](https://github.com/ovenbits/red-mango/blob/master/doc/api/favorites.md)
* [Check ins](https://github.com/ovenbits/red-mango/blob/master/doc/api/checkins.md)
* [Rewards](https://github.com/ovenbits/red-mango/blob/master/doc/api/rewards.md)