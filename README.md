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

# Icons
s=Signum.signal(u, text: "Hello World New", sticky: true, title: "this is test title", icon:'fa-regular fa-t-rex')

# Buttons and links
s=Signum.success(u, text:"Hello World New", sticky: true, title: "this is test title", metadata: {buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}]})
s=Signum.signal(u, text:"Hello World New", sticky: true, title: "this is test title", metadata: {buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}]}, icon: 'fa-regular fa-t-rex')
s=Signum.signal(u, text:"Hello World New", sticky: true, title: "this is test title", metadata: {buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"},{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"},{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}]}, icon: 'fa-regular fa-t-rex')

# This shows a progress bar
s=Signum.success(u, text:"Hello World New", sticky: true, title: "this is test title", metadata: {buttons:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}], links:[{title: "Google", url:"http://www.google.com"}, {title: "Apple", url: "http://www.apple.com"}, {title: "Amazon", url: "http://www.amazon.com"}]}, count:75, total:150)
```

Above we used the `Current.user` as the user to signal to.

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
