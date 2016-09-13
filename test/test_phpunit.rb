#!/usr/bin/env ruby

require 'minitest/autorun'
require 'simplecov-phpunit'


class TestPhpunit < MiniTest::Test
	
	include SimpleCov::Formatter
	
	def test_base
		assert_instance_of(String, SimpleCov::Formatter::PHPUnitFormatter::VERSION)
	end
	
end
