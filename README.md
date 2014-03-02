[![Build Status](https://secure.travis-ci.org/coldfumonkeh/ruby-sinatra-url_shortener.png?branch=master)](http://travis-ci.org/coldfumonkeh/ruby-sinatra-url_shortener)

[![Coverage Status](https://coveralls.io/repos/coldfumonkeh/ruby-sinatra-url_shortener/badge.png)](https://coveralls.io/r/coldfumonkeh/ruby-sinatra-url_shortener)

URL Shortening Application
============

A Ruby application using Sinatra to create shortened URLs for use in social media sites (and anywhere else you want to place them).

Simply fork it and build. Good times.

Includes Bundler, DataMapper and Haml.

Works with Ruby 1.9.2 and 1.9.3


Configuration
----------------

Some configuration variables can be set within <tt>environment.rb</tt>. The database is also created within this file. This application uses DataMapper and a sqlite3 database.

The model/s for the application are stored in the <tt>lib</tt> directory and are auto-loaded.

Installation
----------------

Unzip / clone project into desired location. Install bundle and then run server:

	bundle install
	ruby application.rb


Download
----------------
[URL Shortener ](https://github.com/coldfumonkeh/ruby-sinatra-url_shortener/downloads)
    

### 1.0.1 - April 04, 2012###
 
- Commit: Updated for testing
- Addition of rspec tests to run checks on the application routes
- Addition of new root /post route to allow for url shortening from get or post requests


### 1.0.0 - January 31, 2012###
 
- Commit: Initial Release
- Revised save method to include first_or_create for short_urls and added clickTrack model

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/coldfumonkeh/ruby-sinatra-url_shortener/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

