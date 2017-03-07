# Popart

Use Sauce Labs to generate screenshots for your site across a range of browsers.

Popart works fast!  It can use as much of your Sauce Labs concurrency as required (default is 5 concurrent sessions).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'popart'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install popart

## Usage

Currently, Popart only supports screenshots of a single page directly accessible by URL (with or without Sauce Connect).

To use Popart, install it (as above).

Set the `SAUCE_USERNAME` and `SAUCE_ACCESS_KEY` environment variables to the values for your account.

To run: 

`popart url_to_screenshot`.

This will cause Popart to take a shot with the default browsers (Chrome and Firefox Latest on Windows 10) and save them to `./screenshots`.

### Configuring browsers, threadcount and output location

To configure further, copy `example_config.yaml` to your system, then customise to suit your requirements.  Pass config files to Popart like so:

`popart url_to_screenshot location_of_config_file`

## Support
As an open source project, this is a volunteer effort. Be kind to the authors and maintainers, and expect support commensurate with what this product cost you: Nothing.

This is not an official Sauce Labs product.  Do not ask their support department to assist with any issues; They are not responsible.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[DylanLacey]/popart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## TODO
* Check account concurrency limit and use that by default
* Error handling.  Any.

