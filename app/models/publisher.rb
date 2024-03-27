class Publisher < ApplicationRecord
  has_many :books

  def self.ransackable_associations(auth_object = nil)
    # List the associations you want to be searchable.
    # This example allows searching through the 'books' association.
    # Make sure you exclude any associations that might lead to exposure of sensitive information.
    %w[books]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id name updated_at]
  end
end
