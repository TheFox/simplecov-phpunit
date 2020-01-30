# SimpleCov PHPUnit Formatter

PHPUnit-like HTML Formatter for SimpleCov.

This [SimpleCov](https://www.ruby-toolbox.com/projects/simplecov)-plugin generates a coverage report (`coverage/index.html`) done like by [PHPUnit](https://phpunit.de/) ([PHP_CodeCoverage](https://github.com/sebastianbergmann/php-code-coverage)). Each Ruby source file get its own HTML page.

## Project Outlines

The project outlines as described in my blog post about [Open Source Software Collaboration](https://blog.fox21.at/2019/02/21/open-source-software-collaboration.html).

- The main purpose of this software is to provide a PHPUnit-like layout for SimpleCov.
- This list is open. Feel free to request features.

## Install

The preferred method of installation is via RubyGems.org:
https://rubygems.org/gems/simplecov-phpunit

```bash
gem install simplecov-phpunit
```

or via `Gemfile`:

```ruby
gem 'simplecov-phpunit', '~>1.0'
```

or via `.gemspec`:

```ruby
spec.add_development_dependency 'simplecov', '~>0.12'
spec.add_development_dependency 'simplecov-phpunit', '~>1.0'
```

## Usage

```ruby
require 'simplecov'
require 'simplecov-phpunit'

SimpleCov.formatter = SimpleCov::Formatter::PHPUnit
SimpleCov.start
```

## Project Links

- [SimpleCov PHPUnit Formatter Gem](https://rubygems.org/gems/simplecov-phpunit)

## Weblinks

- [SimpleCov](https://www.ruby-toolbox.com/projects/simplecov) ([GitHub](https://github.com/colszowka/simplecov))
- [PHPUnit](https://phpunit.de/)
