

module ProfilesHelper
  require 'rest_client'

	def get_geo(address)
		data = JSON.parse(RestClient.get(geo_url(address)))
		return nil if data['status'] == "ZERO_RESULTS"
		loc = data['results'].first['geometry']['location']
		loc['lat'] = geo_offset(loc['lat'])
		loc['lng'] = geo_offset(loc['lng'])
	  loc
	end

	def geo_url(address)
		Addressable::URI.new(
		  scheme: "http",
		  host: "maps.googleapis.com",
		  path: "maps/api/geocode/json",
		  query_values: { :address => address, :sensor => "false" }
		).to_s
	end

	def geo_offset(coord)
	  if (rand < 0.5)
		  coord + (rand * 0.001 + 0.001)
		else
			coord - (rand * 0.001 + 0.001)
		end
	end


end
