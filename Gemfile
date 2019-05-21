source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner', '~> 1.7.0'
  gem 'dotenv-rails', '~> 2.7.2'
  gem 'factory_bot', '~> 5.0.2'
  gem 'faker', '~> 1.9.3'
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop', '~> 0.68.1', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise_token_auth', '~> 1.1.0'
gem 'omniauth', '~> 1.9.0'

gem 'active_model_serializers', '~> 0.10.0'
gem 'wor-paginate', '~> 0.1.4'

gem 'redis-namespace', '~> 1.6.0'
gem 'sidekiq', '~> 5.2.7'

gem 'pundit', '~> 2.0.1'

gem 'httparty', '~> 0.17.0'

gem 'webmock', '~> 3.5.1'
