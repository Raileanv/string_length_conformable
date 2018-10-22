# StringLengthConformable

[![Gem Version](https://badge.fury.io/rb/string_length_conformable.svg)](https://badge.fury.io/rb/string_length_conformable)

# Description

### This gem resolves basically two problems.
---
1. MySQL for strings(VARCHAR(255)) by default has limit 255 characters. And when developer left this attribute without any length validation, then it's possible to face with situation when user unintentionally or intentionally will pass in text field more characters. So, then, probably you will get 500...
---
2. PostgreSQL. The maximum number of characters for variable unlimited length types (text, varchar) is undefined. There is a limit of size in bytes for all string types: In any case, the longest possible character string that can be stored is about 1 GB.
And when developer left this attribute without any length validation, then it's possible to face with situation when user unintentionally or intentionally will try to full up your database with lots of GB of 'important' info.
---

Both of this cases, I guess, are not very pleasant.

This gem adds default length validation for all string attributes.
Except those which are already vlidated in standart rails way.

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

## Example

```ruby
#schema.rb
create_table "users", force: :cascade do |t|
  t.string "name"
  t.string "description"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

```ruby
# user.rb
class User < ApplicationRecord
  acts_as_string_length_conformable
  validates :description, length: { maximum: 800 }
end
```
`example for MySQL(VARCHAR(255))`
```ruby
john = User.new
john.name = 'n'*500 # exception "is too long, 255 characters is the maximum allowed"
john.description = 'd'*799 # ok
```
`example for PostgreSQL(1gb)`
```ruby
john = User.new
john.name = 'n'*100.000.000.000 # exception "is too long, 1000 characters is the maximum allowed"
john.description = 'd'*799 #
```
___

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Contributing

1. Fork it ( https://github.com/Yaponcik/string_length_conformable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
