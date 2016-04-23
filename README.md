# Dpr

Dpr is the simplest Ruby Http client. It lets you do HTTP directly on URL strings. If a string can respond to_i and return the integer value of the string or 0 if it is not a integer, then it only makes sense to make it respond to http methods also. If you want to do HTTP really fast without much setup or hassle in a pry or IRB session, then Dpr is what you want. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dpr'
```

## Usage
Here is a basic usage of dpr. Calling http_get on a url string returns the parsed response body(hash) and the response code. 

```ruby
resp, code = 'http://api.openweathermap.org/data/2.5/weather?q=London'.http_get
```

If the string is not a url, dpr methods will return empty hash and -1.

```ruby
resp, code = 'dasd'.http_get
resp # {}
code # -1
```

### Headers and Parameters

```ruby
slack_incoming_hook_url.http_post
                          headers: { "Content-Type" => "application/json" }, 
                          params: { text: 'Dpr is so cool yo!' }
```

### Methods

Dpr supports all http methods.

```ruby
url_string.http_get
url_string.http_post
url_string.http_delete
url_string.http_put
url_string.http_patch
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SudhagarS/dpr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

