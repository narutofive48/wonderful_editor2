source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'active_model_serializers', '~> 0.10.0'
gem 'devise_token_auth'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  # gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
