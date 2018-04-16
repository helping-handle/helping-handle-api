source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "https://github.com/helping-handle/helping-handle-api"
end

gem 'rails', '~> 5.1.6'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'devise'
gem 'faker'

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
