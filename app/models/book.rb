class Book < ApplicationRecord
  has_one :publisher
  belongs_to :publisher
  has_many :book_authors, dependent: :destroy
  has_many :authors, :through => :book_authors
  has_many :book_genres, dependent: :destroy
  has_many :genres, :through => :book_genres
  after_create :save_json

  def save_json
    puts "We are storing data to JSON"
    data = {}
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

  def self.ransackable_associations(auth_object = nil)
    ["authors", "book_authors", "book_genres", "genres", "publisher"]
  end

  def self.ransackable_attributes(auth_object = nil)
    # List the attributes you want to be searchable. Exclude any sensitive information.
    # The list provided in the error message is a good starting point, but let's assume 'id_value' might be sensitive or irrelevant.
    # Adjust the list according to your application's needs.
    ["created_at", "id", "isbn", "published_date", "publisher_id", "rating", "title", "total_pages", "updated_at"]
  end
end
