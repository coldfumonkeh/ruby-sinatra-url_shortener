class ShortURL

	include DataMapper::Resource
	
	property :short_url, String, key: true, unique_index: true, required: true
	property :url, Text, required: true
	property :created_at, DateTime
	property :updated_at, DateTime
	
end