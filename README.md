URL Shortening Application
============

A Ruby application using Sinatra to create shortened URLs for use in social media sites (and anywhere else you want to place them).

Simply fork it and build. Good times.

Includes Bundler, DataMapper and Haml.

Works with both Ruby 1.8.7 and Ruby 1.9.2


Configuration
----------------

Some configuration variables can be set within <tt>environment.rb</tt>. The database is also created within this file. This application uses DataMapper and a sqlite3 database.

The model/s for the application are stored in the <tt>lib</tt> directory and are auto-loaded.

Installation
----------------

	bundle install
	ruby application.rb


Download
----------------
[URL Shortener ](https://github.com/coldfumonkeh/ruby-sinatra-url_shortener/downloads)
    

### 1.0.0 - January 31, 2012###
 
- Commit: Initial Release