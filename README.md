# Art Share API

We're going to continue building on the API we built in the first
routes project. Our goal is to build an application to store, share, and
comment on artwork, as well as search for users.

Each user has a set of artworks that they own/control. These artworks
can also be shared with other users. An artwork that has been shared
with one or more other users will be visible to those users, but the
artwork still 'belongs to' the original user.

Although we will maintain this conceptual distinction between a user's
own artworks vs. the artworks that have been shared with that user, we
will eventually write an index method that will combine both types of a
user's viewable artworks together so that we can see any art made by or
shared with that user.

## Learning Goals

* Be able to write Active Record models quickly
* Know how to write a `user_params` method
* Be able to write the five API RESTful controller methods
* Know how to test your API endpoints with Postman
* Know how to create and destroy join table records via controller
methods
* Know how a nested route works
