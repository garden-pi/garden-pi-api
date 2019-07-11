Garden Pi API
===============


# Overview

This repository holds the API for the Garden Pi project. 

# Setup 

To setup, please run the following commands:

`bundle install`
`rails db:setup`

Then add an `.env` file to the root of this directory with the following keys:

```
APP_SECRET=<insert app secret>
TREFLE_API_KEY=<insert Trefle API key>
```
Finally, you can start the server with:
`rails s`


# Endpoints

All authorized routes require an `Authorization` header containing the word "Bearer" followed by a valid JWT token. Example:
```
{
  Authorization: "Bearer your-token-goes-here"
}
```

## Auth

### POST `/api/v1/login`
- Params: email, password
- Authorized: No
- Response: { user: object, jwt: string }

## Users

### POST `/api/v1/users`
- Params: email, password, name
- Authorized: No
- Response: { user: object, jwt: string }

### GET `/api/v1/profile`
- Query Params: N/A
- Authorized: Yes
- Response: { user: object }

## Species

### GET `/api/v1/species`
- Query Params: 
  - `term` - used to do a search by name (common and scientific) in both Trefle API and this API
- Authorized: No
- Response: { species: array }



# Supporting Documentation

[Domain model]()

