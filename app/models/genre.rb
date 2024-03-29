class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, :through => :book_genres
  chars = "a,c,v"

  def name
    "#{genre_name}"
  end
end
