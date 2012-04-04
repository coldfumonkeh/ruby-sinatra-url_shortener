require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'environment')

configure do
	set :views, "#{File.dirname(__FILE__)}/views"
end

configure :development do
    DataMapper.auto_upgrade!
    
    # very useful for debugging parameters sent via the console
	before do
	  puts '[Params]'
	  p params
	end
    
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
	
	def generate_short_url(long_url)
	  @shortcode = random_string 5
  
    su = ShortURL.first_or_create(
            { :url => long_url  }, 
            {
              :short_url  =>  @shortcode,
              :created_at =>  Time.now,
              :updated_at =>  Time.now
            })
    
    get_site_url(su.short_url)
	end

end


# root page
get '/' do

	if params[:url] and not params[:url].empty?
	
		generate_short_url(params[:url])
		
	else
		# you can use this page to redirect to another location
		# or to display a front-end form for any site visitors
		
		# get the current count of all links stored
    # @urls = ShortURL.all;
    
    # erb :index
		
	end

end

post '/' do

  if params[:url] and not params[:url].empty?
  
    generate_short_url(params[:url])
        
  end
    # you can use this page to redirect to another location
    # or to display a front-end form for any site visitors
    
    # get the current count of all links stored
    # @urls = ShortURL.all;
    
    # erb :index
    
end


# display short url from root
["/get/:short_url", "/:short_url"].each do |path|
get path do
	@URLData = ShortURL.get(params[:short_url])

	if @URLData
	
		# log the click in the database		
		ct = ClickTrack.new
		ct.attributes	=	{ 
				:short_url 	=> 	params[:short_url],
				:url		=>	@URLData.url,	
				:clicked_at	=>	Time.now
			}
		ct.save
		
		redirect @URLData.url
	else
		'no short url found'
	end
	
end
end

# expand url data
get '/expand/:hash/?' do
	@URLData = ShortURL.get(params[:hash])	

	if @URLData
		
		content_type :json
		{ :url => get_site_url(@URLData.short_url), :long_url => @URLData.url, :hash => params[:hash] }.to_json
		
	else
	
		content_type :json
		{ :message => 'No hash parameter was specified or no short URL was found to match the provided hash' }.to_json
		
	end
end