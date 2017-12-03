# Ruby test

## Description

This repository contains the test made in Ruby for Users basic operations.

- Create
- Authenticate
- List users when a user is authenticated with a valid token
- Delete token
- List a single user when a user is authenticated with a valid token
- Verifies if a user is authenticated

## Comments

This test was made in a very basic way, due to many things involved in solution, such as:
- Controllers and Models creation
- Authentication with password
- Token Generation
- Authentication with token

JWT was used to create tokens, due to time expiration was not implemented, only token destroy.

There is a library used to generate the password digestion, i installed bcrypt at the Gemfile.

When a user wants to retrieve information from a resources that needs users is authenticated, is checked with token, maybe in the way that is implemented could me dangerous by only reviewing user existence with that token withot the expiration. 

The approach was focused in give json response just like an RESTful API, due to time i couldn't achieve to response correctly with http headers and response codes, only a basic json response format normalized to:

- status (equivalent to http response codes)
- msg (given message to end user with a little description of the result)
- data (when call is succesful, data contains the information required)

A last basic functionality added to index method was the possibility to ask for a html table or json format in the same method. This is because it is known that in a RESTful API we could use a sufix indicating the format that we want to retrieve (i.e. json, xml, html), with a little more time we could implement methods to switch response with different formats and that methods could manage the http headers and responses too.

## Examples

### Basic user creation:

This method insert a user into database and generates password digestion for saving at database
(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby01.png)

### Basic user authentication:

When a user is authenticated, a token is generated and saved into database, the api responses with the token saved, so we can do other requests with that token.
(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby02.png)


### Result when the user is not logged in

Api reviews not password but token when an API requests is made

(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby03.png)

### The way we have to send token for authentication of our requests

When we want to do a requests on a resource that is restricted to authenticated users we have to send token at the payload.
(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby04.png)

### Result when we retrieve users lists in json format
We have to specify at the url the variable type with value json, so we can retrieve data in json format
(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby05.png)


### Result when we retrieve a singlel user from database in json format

This is the result of a single user in database, not the authenticated user but the user with the id in the parameters.
(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby06.png)


### Result when a user doesn't exists at database

Maybe we want to retrieve user but it doesn't exists, in an API response it should be in this way because the resource is not found, like i said, the right way of implement http responses is not complete due to time to do the test.

(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby07.png)
