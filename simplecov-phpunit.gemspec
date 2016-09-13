# coding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simplecov-phpunit/version'

Gem::Specification.new do |spec|
	spec.name          = 'simplecov-phpunit'
	spec.version       = SimpleCov::Formatter::PHPUnitFormatter::VERSION
	spec.date          = SimpleCov::Formatter::PHPUnitFormatter::DATE
	spec.author        = 'Christian Mayer'
	spec.email         = 'christian@fox21.at'
	
	spec.summary       = %q{SimpleCov PHPUnit Formatter}
	spec.description   = %q{PHPUnit-like HTML Formatter for SimpleCov.}
	spec.homepage      = SimpleCov::Formatter::PHPUnitFormatter::HOMEPAGE
	spec.license       = 'GPL-3.0'
	
	spec.files         = `git ls-files -z`.split("\x0").reject{ |f| f.match(%r{^(test|spec|features)/}) }
	spec.require_paths = ['lib']
	spec.required_ruby_version = '>=1.9.0'
	
	spec.add_development_dependency 'minitest', '~>5.8'
	spec.add_development_dependency 'simplecov', '~>0.12'
end
