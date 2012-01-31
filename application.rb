require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'environment')

configure do
	set :views, "#{File.dirname(__FILE__)}/views"
end

error do
	e	=	request.env['sinatra.error']
	Kernel.puts e.backtrace.join("\n")
	'Application error'
end

helpers do  
  	include Rack::Utils  
  	alias_method :h, :escape_html  
  
  	def random_string(length)  
    	rand(36**length).to_s(36)  
  	end 

	def get_site_url(short_url)
		SiteConfig.url_base + short_url
	end

end


# root page
get '/' do

	if params[:url] and not params[:url].empty?
		@shortcode = random_string 5

		su 		= 	ShortURL.new
        su.url          =       params[:url]
        su.short_url    =       @shortcode
        su.created_at   =       Time.now
        su.updated_at   =       Time.now
        su.save

		if su.save
			get_site_url(su.short_url)
		else
  			#show an error
			'The database didnt store the short url'
		end

	else
		# you can use this page to redirect to another location
		# or to display a front-end form for any site visitors

	end

end

# shorten.json
get '/shorten.json' do
 
	if params[:url] and not params[:url].empty?
    
    	@shortcode = random_string 5
			
		su              =       ShortURL.new
        su.url          =       params[:url]
        su.short_url    =       @shortcode
        su.created_at   =       Time.now
        su.updated_at   =       Time.now
        su.save

		content_type :json
		{ :url => get_site_url(su.short_url), :long_url => su.url, :hash => @shortcode }.to_json

	else

		content_type :json
		{ :message => 'No URL parameter was specified' }.to_json

	end

end

# display short url from root
get '/:short_url' do
	@URLData = ShortURL.get(params[:short_url])	

	if @URLData
		redirect @URLData.url
	end
	
end

# expand url data
get '/expand/:hash' do
	@URLData = ShortURL.get(params[:hash])	

	if @URLData
		
		content_type :json
		{ :url => get_site_url(@URLData.short_url), :long_url => @URLData.url, :hash => params[:hash] }.to_json
		
	else
	
		content_type :json
		{ :message => 'No hash parameter was specified or no short URL was found to match the provided hash' }.to_json
		
	end
end