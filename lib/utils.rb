

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

    def self.post_data(book, author, genre)

        data = {:book => book , :author => author, :genre => genre}
        puts data.to_json 
        uri = URI('https://enhqlf4vs2wgl.x.pipedream.net/')
        res = Net::HTTP.post_form(uri, data)
        puts res.body  if res.is_a?(Net::HTTPSuccess)

    end





end


 
