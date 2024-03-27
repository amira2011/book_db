class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, :through => :book_authors

  def name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    # Specify only the attributes you want to be searchable.
    # Exclude sensitive information like passwords or tokens.
    %w[first_name created_at updated_at]
  end


  def self.ransackable_associations(auth_object = nil)
    # List the associations you want to be searchable.
    # Ensure you exclude any associations that might lead to exposure of sensitive information.
    %w[book_authors books]
  end

end
