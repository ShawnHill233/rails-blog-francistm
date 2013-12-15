source "https://rubygems.org"

gem "jquery-rails"

gem "rails", "3.2.14"
gem "mysql2", "0.3.11"
gem "sorcery", "~> 0.8.2"
gem "qiniu-rs", "~> 3.4.6"
gem "kramdown", "~> 1.3.0"
gem "wice_grid", "~> 3.4.2"
gem "rails_config", "~> 0.3.3"
gem "jquery-ui-rails", "~> 4.1.0"
gem "bootstrap-sass", "~> 3.0.3.0"

group :test do
  gem "faker", "~> 1.1.2"
end

group :assets do
  gem "uglifier", ">= 1.0.3"
  gem "sass-rails",   "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.1"
end

group :production do
  gem "puma", "~> 2.0.0", :platforms => :ruby
end

group :test, :development do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
  gem "capistrano", "~> 3.0.1"
  gem "capistrano-rvm", "~> 0.0.3"
  gem "capistrano-rails", "~> 1.1.0"
  gem "capistrano-bundler", "~> 1.0.0"
end
