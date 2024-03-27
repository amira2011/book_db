class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre
  def self.ransackable_attributes(auth_object = nil)
    # Whitelist attributes that are relevant and safe for searching.
    # It's common to include foreign keys and timestamps, but you should exclude any sensitive information.
    # Assuming 'id_value' is not sensitive or is not present, adjust the list according to your model.
    ["book_id", "created_at", "genre_id", "id", "updated_at"]
  end
end
