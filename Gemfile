source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0.rc1"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails", ">= 3.4.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", ">= 0.9.2"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", ">= 0.9.0"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", ">= 0.7.3"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
# gem "tailwindcss-rails", ">= 0.5.3" # WORKAROUND below

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.11"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

# Use Sass to process CSS
gem "sassc-rails", "~> 2.1"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", ">= 1.0.0", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", ">= 4.1.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler", ">= 2.3.3"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0"
  gem "webdrivers"
end

# END Rails generated gems <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


# BEGIN application specific gems (sorted alpha) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

gem 'awesome_print', require: false, group: [:development, :test]
gem 'bashtetikn'
gem 'database_cleaner', require: false, group: [:development, :test]
gem 'factory_bot_rails', require: false, group: [:development, :test]
gem 'faker', require: false, group: [:development, :test]
gem 'mry', require: false, group: [:development] # Migrates .Rubocop.Yml, $ mry .rubocop.yml
gem 'pry-byebug', platform: :mri, group: [:development, :test] # for Debugger/pry
gem 'pry-rails', platform: :mri, group: [:development, :test]
gem 'rack-heartbeat'
gem 'rexml', group: [:development, :test] # XML toolkit for Ruby. Now a bundled gem. Used by rspec.
gem 'rspec-html-matchers', require: false, group: [:test]
gem 'rspec-its', require: false, group: [:test]
gem 'rspec-json_expectations', require: false, group: [:test]
gem 'rspec-rails', group: [:development, :test]
gem 'rubocop', require: false, group: [:development] # Ruby static code analyze
gem 'solargraph', require: false, group: [:development, :test] # for Linter
gem 'simple_form' # Forms made easy
gem 'slim-rails' # Slim templates generator
gem "tailwindcss-rails",
    github: "dorianmariefr/tailwindcss-rails",
    branch: "minimal" # WORKAROUND: fixes SassC::SyntaxError: Error: unterminated attribute selector for type", https://stackoverflow.com/questions/68898511/tailwindcss-typography-sasscsyntaxerror-error-unterminated-attribute-select
gem 'validate_url'
gem 'vcr', require: false, group: [:test]
gem 'webmock', require: false, group: [:test] # for vcr
