# MakersBnB

makersBnB is a system for users to list and view spaces that can be booked for staying overnight.

## MVP

Users can sign in/sign out and create listings for spaces. Users can view a list of their spaces.

### Tech Stack
* Model/Controller: Sinatra, Ruby-standard-style, JavaScript, jQuery, HTML, CSS
* Database: PostGres, Active Records
* Testing: Rspec, Capybara
* Third-party: SendGrid

### Installation
* git clone git@github.com:
* bundle install
* rake db:setup
* rake db:migrate
* rake db:seed

### How to use?



## User Stories

### Listing a new space

```
As a user,
so that guests can view my space,
I need to be able to list a new space.

As a user,
so that my space is listed as mine,
I need to be able to sign up with username and email.

As a user,
so that I can have more than one space listed,
I need to be able to post multiple spaces and view these on my account.
```

### Spaces have a name, description, price and available dates

```
As a user,
so that guests can see information about the space,
I need to be able to add descriptive information for the space: name, description and price.

## Users should be able to offer a range of dates where their space is available.

As a user,
so that guests can see if the space is available when they would like it,
I need to be able to add a range dates the space is available.
```

### Booking and confirming spaces

```
As a user,
so that I can stay somewhere
I need to be request to hire a space

As a user,
so that a manage the renting of my properties
I need to be able to approve a booking
```

### Confirmed bookings become unavailable to other users

```
As a user,
so that I am able to see what dates are available to book for a space,
Dates that are already booked should be shown as unavailable
```

### Unconfirmed bookings remain available to other users

```
As a user,
until I have confirmed the booking,
the space should still be available to be booked
```

### Other Links
App hosted on Heroku here
Group Notion here

### Credits
* DomTunstill
* ollyholly
* nateg101
* duncan9099

### License

MIT © DomTunstill nateg101 duncan9099 ollyholly
