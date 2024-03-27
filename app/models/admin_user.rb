class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  def self.ransackable_attributes(auth_object = nil)
  # Specify only the attributes you want to be searchable.
  # Exclude sensitive information like passwords or tokens.
    %w[id email created_at updated_at]
  end
end
