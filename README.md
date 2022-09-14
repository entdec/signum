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

Above we used the `Current.user` as the user to signal to.

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
