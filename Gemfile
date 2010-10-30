source 'http://rubygems.org'

gem 'rails', '3.0.1'

gem 'acts_as_commentable', '>= 3.0.0'
gem 'acts-as-taggable-on', '>= 2.0.6'
gem 'authlogic', :git => 'git://github.com/crossroads/authlogic.git', :branch => 'rails3'
gem 'capistrano-ext'
gem 'gravatar-ultimate', :git => 'git://github.com/crossroads/gravatar.git'
gem 'haml', '>= 3.0.18'
gem 'is_paranoid', :git => 'git://github.com/crossroads/is_paranoid.git', :branch => 'rails3'
gem 'pg', '>= 0.9.0'
gem 'paperclip', :git => 'git://github.com/crossroads/paperclip.git'
gem 'will_paginate', '>= 3.0.pre2'
gem 'whenever'
gem 'meta_search', :git => 'git://github.com/ernie/meta_search.git'

gem 'ffaker'

group :cucumber, :test, :development do
  gem 'test-unit', '1.2.3' if RUBY_VERSION.to_f >= 1.9

  gem 'rvm', '>= 1.0.15'
  gem 'rspec-rails', '>= 2.0.1'
  gem 'rcov'

  gem 'factory_girl'
  gem 'thin'

  # gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  # gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  # gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  # gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  # gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"

  if RUBY_VERSION.to_f >= 1.9
    # -- --with-ruby-include=$HOME/.rvm/src/ruby-1.9.2p0/
    gem 'ruby-debug19'
  else
    gem 'ruby-debug'
  end
end

group :cucumber do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'spork'
  gem 'headless'
end

group :test do
  gem 'shoulda'
  gem 'autotest-rails'
  gem 'webrat'
  gem 'ci_reporter', :git => 'http://github.com/crossroads/ci_reporter.git'
end
