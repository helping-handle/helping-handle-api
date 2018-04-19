source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "https://github.com/helping-handle/helping-handle-api"
end

gem 'rails', '~> 5.2.0'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'devise'
gem 'devise-jwt'
gem 'faker'
gem 'money-rails'
gem 'bootsnap', '>= 1.1.0'

group :development, :test do
  gem 'byebug'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Added at 2018-04-19 01:54:57 -0600 by jason:
gem "as-duration", "~> 0.1.1"
