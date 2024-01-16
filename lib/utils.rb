

require 'uri'
require 'net/http'
require 'json'

class Utils

    def self.get_uri_data(url)
        begin
            uri = URI(url)
            res = Net::HTTP.get_response(uri)
            repos= res.body if res.is_a?(Net::HTTPSuccess)

            if repos
            data = JSON.parse(repos)
            end

            data 
            
        rescue
            data=[]
        end
    end

    def self.post_data(data)

        
        
        uri = URI('https://enhqlf4vs2wgl.x.pipedream.net/')
        req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        req.body = data.to_json
        Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(req)
        end

    end

    def self.to_json
        
        puts "welcome"


    end





end


 
