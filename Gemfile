source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.2.2"

gem "rails", "~> 7.0.7", ">= 7.0.7.2"
gem "sprockets-rails"
gem "pg", "~> 1.5.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard", "~> 1.31.1"
  gem "standard-rails", "~> 0.2.0"
  gem "rspec-rails", "~> 6.0.3"
  gem "rspec-github", "~> 2.4", require: false
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end
