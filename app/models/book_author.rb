class BookAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author

  def self.ransackable_attributes(auth_object = nil)
    # Whitelist attributes that are safe and relevant for searching.
    # Exclude any sensitive or irrelevant attributes to enhance security and usability.
    %w[author_id book_id created_at id updated_at]
  end
end
