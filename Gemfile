source 'http://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.5'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#slim template
gem 'slim'

#pagerclip for image uploading
gem 'paperclip'

#simple_form for active record
gem 'simple_form', '~> 3.1.0.rc1'

#postgres
gem 'pg'

#summernote dependencies
gem 'bootstrap-sass'
gem 'font-awesome-sass'

#summernote
gem 'summernote-rails'

#nokogiri
gem 'nokogiri'

#xml parser
gem 'actionpack-xml_parser'

#for wechat api
gem "wechat-rails", git:"https://github.com/skinnyworm/wechat-rails"

gem "figaro"

group :development do
  gem 'pry'
  #capistrano for deploying
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem "capistrano-db-tasks", github: 'ryancheung/capistrano-db-tasks', branch: 'postgresql-9.2', require: false
end

group :production, :staging do
  #unicorn
  gem 'unicorn'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
