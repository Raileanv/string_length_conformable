# StringLengthConformable


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_length_conformable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_length_conformable

## Usage

### To validate all strings in certain model, add `acts_as_string_length_conformable` method in that model

```ruby
# model_name.rb
class ModelName < ApplicationRecord
  acts_as_string_length_conformable

end
```
### To validate all strings in whole app, add `acts_as_string_length_conformable` in ApplicationRecord

```ruby
class ApplicationRecord < ActiveRecord::Base
  acts_as_string_length_conformable
  self.abstract_class = true
end

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Contributing

1. Fork it ( https://github.com/Yaponcik/string_length_conformable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
