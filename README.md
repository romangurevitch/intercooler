# Intercooler

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/intercooler`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'intercooler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install intercooler

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


### Pipeline
```
node {
  stage 'Clone Gem Demo git repo'
  git url: 'https://github.com/TamirHadad/intercooler.git'
  def version = "2.${env.BUILD_ID}.0"
  withEnv(["RUBYGEMS_HOST=http://localhost:8081/artifactory/api/gems/gems-local","GEM_VERSION=${version}"]) {
      stage "Let's test"
      sh "rspec spec"
      stage "Let's build"
      sh "bundle install"
      sh "gem build intercooler.gemspec"
      stage "Let's Deploy"
      sh "gem push intercooler*${version}.gem"
  }
   env.BUILD_PROPS = "gem.name=intercooler;gem.version=${version}"
}
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/intercooler. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

