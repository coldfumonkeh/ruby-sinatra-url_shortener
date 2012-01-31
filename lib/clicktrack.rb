class ClickTrack

	include DataMapper::Resource
	
	property :id, Serial, key: true, unique_index: true, required: true
	property :short_url, String, required: true
	property :url, Text, required: true
	property :clicked_at, DateTime
	
end