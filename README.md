# Kangal

[![Code Climate](https://codeclimate.com/github/kebab-project/kangal.png)](https://codeclimate.com/github/kebab-project/kangal)
[![Dependency Status](https://gemnasium.com/kebab-project/kangal.png)](https://gemnasium.com/kebab-project/kangal)
[![Build Status](https://travis-ci.org/lab2023/kangal.png?branch=develop)](https://travis-ci.org/lab2023/kangal)


## Requirements

Before generating your application, you will need:

* Ruby ~> 2.0
* Rails ~> 4.0

## Usage

In your Gemfile

```ruby
gem 'kangal'
```

### Email Validator
```ruby
require 'kangal'
class User
  include ActiveModel::Validations
  attr_accessor :email

  # Email validator
  validates :email, presence: :true, email: :true
end


p = User.new
p.email = "info@lab2023.com"
p.valid? # => true

p.email = "info@lab"
p.valid? # => false

p.email = "Onur Ozgur <info@lab2023.com>"
p.valid? # => false
```

### Subdomain Validator
```ruby
require 'kangal'
class User
  include ActiveModel::Validations
  attr_accessor :subdomain

  # Subdomain validator
  validates  :subdomain, subdomain: true

  # Or
  validates  :subdomain, subdomain: { :reserved => %w(foo bar) }
end


p = User.new
p.subdomain = "www"
p.valid? # => false

p.subdomain = "https"
p.valid? # => false

p.subdomain = "-lab2023"
p.valid? # => false

p.subdomain = "-lab2023-"
p.valid? # => false

p.subdomain = "foo"
p.valid? # => false

p.subdomain = "lab2023"
p.valid? # => true
```

**Default reserved names:** www, ftp, mail, pop, smtp, admin, ssl, sftp, http, https

### Turkish Government Identity Number Validator
```ruby
require 'kangal'
class User
  include ActiveModel::Validations
  attr_accessor :identity

  # Identity Number validator
  validates :identity, presence: :true, identity_number: :true
end

p = User.new
p.identity = "44234234"
p.valid? # => false

p = User.new
p.identity = "02343214582"
p.valid? # => false

p = User.new
p.identity = "83317527040" # (this isn't a real identity number)
p.valid? # => true
```

### Turkish Government Tax Number Validator
```ruby
require 'kangal'
class User
  include ActiveModel::Validations
  attr_accessor :tax_number

  # Identity Number validator
  validates :tax_number, presence: :true, tcvkn: :true
end

p = User.new
p.tax_number = "44234234"
p.valid? # => false

p = User.new
p.tax_number = "02343214582"
p.valid? # => false

p = User.new
p.tax_number = "6120069217" # (this isn't a real tax number)
p.valid? # => true
```

### IP Validator
```ruby
require 'kangal'
class Server
  include ActiveModel::Validations
  attr_accessor :ip

  # Ip validator
  validates :ip, presence: :true, ip: :true
end

p = Server.new
p.ip = "10.10.10.256"
p.valid? # => false

p = Server.new
p.ip = "2222.22.22.22"
p.valid? # => false

p = Server.new
p.ip = "255.255.255.255"
p.valid? # => true

p = Server.new
p.ip = "132.254.111.10"
p.valid? # => true
```

## Bugs and  Feedback

If you discover any bugs or want to drop a line, feel free to create an issue on GitHub.

http://github.com/lab2023/kangal

## Contributing

Kangal uses [TomDoc](http://tomdoc.org/), [rDoc](http://rubydoc.info/gems/kangal) and [SemVer](http://semver.org/), and takes it seriously.

Once you've made your great commits:

1. Fork Template
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create a Pull Request from your branch
5. That's it!

## Credits

![lab2023](http://lab2023.com/assets/images/named-logo.png)

- Kangal is maintained and funded by [lab2023 - information technologies](http://lab2023.com/)
- Thank you to all the [contributors!](../../graphs/contributors)
- The names and logos for lab2023 are trademarks of lab2023, inc.

## License

Copyright 2014 lab2023 - information technologies
