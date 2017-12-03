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

When a user wants to retrieve information from a resources that needs users is authenticated, is checked with token, maybe in the way that is implemented could me dangerous by only reviewing user existence with that token withot the expiration. 

The approach was focused in give json response just like an RESTful API, due to time i couldn't achieve to response correctly with http headers and response codes, only a basic json response format normalized to:

- status (equivalent to http response codes)
- msg (given message to end user with a little description of the result)
- data (when call is succesful, data contains the information required)

A last basic functionality added to index method was the possibility to ask for a html table or json format in the same method. This is because it is known that in a RESTful API we could use a sufix indicating the format that we want to retrieve (i.e. json, xml, html), with a little more time we could implement methods to switch response with different formats and that methods could manage the http headers and responses too.

## Examples


(https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby01.png|alt=octal)

[[https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby02.png|alt=octal]]

[[https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby03.png|alt=octal]]

[[https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby04.png|alt=octal]]

[[https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby05.png|alt=octal]]

[[https://github.com/omaralvaradoluna/ruby-user-test/blob/master/docs/ruby06.png|alt=octal]]
