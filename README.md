# WhenHub

This is a gem for interacting with [the WhenHub API](https://developer.whenhub.com/).

> WhenHub lets you transform time-ordered information such as a timeline or schedule into a beautiful, interactive, embeddable Whencast that entertains, educates, and provides chronological context.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whenhub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whenhub

## Usage

The best guide for using this gem is the script in `bin/test`, which exercises all of the supported endpoints and prints the method outputs.
You can use this script as a guide for invoking the gem, and you can run it against your live WhenHub account by running:

```
RESTCLIENT_LOG=stdout bundle exec bin/test [YOUR ACCESS TOKEN]
```

The gem uses a client model to query against the API. You create and configure a client with your access token.
(Note: You can find your access token by visiting your [WhenHub account page](https://studio.whenhub.com/account).)

```
require 'whenhub'

client = WhenHub::Client.new(access_token: YOUR_ACCESS_TOKEN)
```

After creating the client you're able to make requests to any of the WhenHub APIs.
Some examples follow below.

### [My User Information](https://developer.whenhub.com/v1.0/reference#users-me)

```
user = client.me
```

### [My Schedules](https://developer.whenhub.com/v1.0/reference#usersmeschedules)

```
schedules = client.schedules.all
```

### [Schedule with Events](https://developer.whenhub.com/v1.0/reference#usersmeschedulesscheduleidfilterincludeevents)

```
schedule = client.schedules.find(schedule_id)
```

### [Schedules with Events & Media](https://developer.whenhub.com/v1.0/reference#schedule-with-events-and-media)

```
schedule = client.schedules.find(schedule_id, media: true)
```

### [Create a new schedule](https://developer.whenhub.com/v1.0/reference#create-a-new-schedule)

```
schedule = client.schedules.create
```

### [Create a new event](https://developer.whenhub.com/v1.0/reference#create-a-new-event)

```
event = schedule.events.create
```

### [Update an event](https://developer.whenhub.com/v1.0/reference#update-an-event)

```
event.name = 'My Event'
event.save
```

### [Remove an event](https://developer.whenhub.com/v1.0/reference#remove-an-event)

```
event.delete
```

### [Delete Multiple Events](https://developer.whenhub.com/v1.0/reference#delete-multiple-events)

```
schedule.events.delete(event_ids)
```

### [Add an image to a Schedule](https://developer.whenhub.com/v1.0/reference#add-an-image-to-a-schedule)

```
schedule.upload_image(url)
```

### [Add an image to an Event](https://developer.whenhub.com/v1.0/reference#add-an-image-to-an-event)

```
event.upload_image(url)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/whenhub.

