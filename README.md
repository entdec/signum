# Signum

Short description and motivation.

## Usage

How to use my plugin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'signum'
```

Add signum to your package.json:

```
yarn add signum
```

Add signum to your application.js:

```
import { Signum } from "@entdec/signum"
// application is a Stimulus application
Signum.start(application)
```

## Use

In controllers, or from background jobs, basically anywhere you want you can use the following methods:

```ruby
Signum.signal(Current.user, text: "Hello world!")
Signum.info(Current.user, text: "We're still here!")
Signum.error(Current.user, text: "Houston, we have a problem!")
Signum.success(Current.user, text: "The Eagle has landed!")
```

You can make a signal sticky, keeping it on the screen until you click it away:
```ruby
s = Signum.signal(Current.user, text: "Hello World New", sticky: true, title: "Sticky")
```

You can add icons:
```ruby
s = Signum.signal(Current.user, text: "Hello World New", title: "Icon", icon:'fa-regular fa-t-rex')
```

Buttons and links:
```ruby
s = Signum.success(Current.user, text: "Hello World New", title: "Link1", buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}])
s = Signum.signal(Current.user, text: "Hello World New", title: "Link2", buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}], icon: 'fa-regular fa-t-rex')
s = Signum.signal(Current.user, text: "Hello World New", title: "Link2", buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"},{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"},{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}])
```

You can also show a progressbar, this is based on count and total. Setting the count to total completes the progressbar.
```ruby
s = Signum.success(Current.user, text: "Hello World New", title: "this is test title", metadata: {buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}]}, count: 75, total: 150)
```

You can also attach attachments
```ruby
attachment = {io: File.open("notes.txt"),
              content_type: "text/plain", filename: "notes.txt"}
s = Signum.success(Current.user, text: "Hello World New", title: "this is test title", attachments: [attachment])
```

Signum returns you the signal object. You can update these signals and they will be rebroadcasted again.

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
