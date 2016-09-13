
GEM_NAME = simplecov-phpunit

include Makefile.common

.PHONY: test
test:
	RUBYOPT=-w $(BUNDLER) exec ./test/suite_all.rb -v
