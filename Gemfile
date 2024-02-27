source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.2.2"

gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.5.4"
gem "puma", "~> 6.0"
gem "importmap-rails"
gem "turbo-rails", "~> 1.5.0"
gem "stimulus-rails", "~> 1.3.0"
gem "tailwindcss-rails", "~> 2.0.31"
gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard", "~> 1.31.2"
  gem "standard-rails", "~> 0.2.0"
  gem "standard-performance", "~> 1.2.1"
  gem "rspec-rails", "~> 6.0.3"
  gem "rspec-github", "~> 2.4", require: false
  gem "rspec-its"
  gem "shoulda-matchers", "~> 5.3.0"
  gem "capybara", "~> 3.39.2"
  gem "selenium-webdriver", "~> 4.14.0"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "oj", "~> 3.16.1"
end
