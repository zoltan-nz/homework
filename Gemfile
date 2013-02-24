source 'https://rubygems.org'

gem 'rails'
gem 'jquery-rails'

#form builder
gem 'formtastic'

#added for puma webserver support
gem 'puma'

#for haml support
gem 'haml'
gem 'haml-rails'

#pagination
gem 'will_paginate'

#bootstrap gems
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'formtastic-bootstrap'

platform :jruby do
  gem 'activerecord-jdbc-adapter'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do

  gem 'sqlite3'

  #add a comment summarizing the current schema
  gem 'annotate'

  #more detailed error message
  gem 'better_errors'

  platforms :ruby do
    gem 'debugger'
    gem 'binding_of_caller' #Not compatible with jruby
  end

  #for fancy console
  gem 'awesome_print'
  gem 'hirb'

  platform :jruby do
    gem 'jdbc-sqlite3'
  end
end

group :production do
  platform :ruby do
    gem 'pg'
  end
end