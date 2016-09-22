# SimpleCov PHPUnit Formatter

PHPUnit-like HTML Formatter for SimpleCov.

This [SimpleCov](https://www.ruby-toolbox.com/projects/simplecov)-plugin generates a coverage report (`coverage/index.html`) done like by [PHPUnit](https://phpunit.de/) ([PHP_CodeCoverage](https://github.com/sebastianbergmann/php-code-coverage)). Each Ruby source file get its own HTML page.

## Install

The preferred method of installation is via RubyGems.org:
https://rubygems.org/gems/simplecov-phpunit

	gem install simplecov-phpunit

or via `Gemfile`:

	gem 'simplecov-phpunit', '~>0.4'

or via `.gemspec`:

	spec.add_development_dependency 'simplecov', '~>0.12'
	spec.add_development_dependency 'simplecov-phpunit', '~>0.4'

## Usage

	require 'simplecov'
	require 'simplecov-phpunit'
	
	SimpleCov.formatter = SimpleCov::Formatter::PHPUnit
	SimpleCov.start

## Project Links

- [SimpleCov PHPUnit Formatter Gem](https://rubygems.org/gems/simplecov-phpunit)
- [Travis CI Repository](https://travis-ci.org/TheFox/simplecov-phpunit)

## Weblinks

- [SimpleCov](https://www.ruby-toolbox.com/projects/simplecov) ([GitHub](https://github.com/colszowka/simplecov))
- [PHPUnit](https://phpunit.de/)

## License

Copyright (C) 2016 Christian Mayer <https://fox21.at>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
