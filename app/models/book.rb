class Book < ApplicationRecord 
    has_one :publisher
    belongs_to :publisher
    has_many :book_authors , dependent: :destroy
    has_many :authors , :through => :book_authors
    has_many :book_genres , dependent: :destroy
    has_many :genres , :through => :book_genres
    after_create :save_json

    def save_json
        puts "We are storing data to JSON"
        data ={}
        data["book"] = self.as_json
        data["authors"] = self.authors.as_json
        data["genres"] = self.genres.as_json
        data["publisher"] = self.publisher.as_json
        #data = []
        #data.push(self.as_json)
        #data.push(self.authors.as_json)
        #data.push(self.genres.as_json)
        Utils.post_data(data)
    end
end