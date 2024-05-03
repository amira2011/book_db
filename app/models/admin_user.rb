class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable,
         :two_factor_authenticatable, otp_secret_encryption_key: '123456789'
  def self.ransackable_attributes(auth_object = nil)
  # Specify only the attributes you want to be searchable.
  # Exclude sensitive information like passwords or tokens.
    %w[id email created_at updated_at]
  end

  # Add a boolean field to determine whether 2FA is required for login
  def otp_required?
    self.otp_required_for_login || false
  end

  # Methods to enable or disable 2FA
  def enable_two_factor_authentication
    self.otp_secret = User.generate_otp_secret
    self.otp_required_for_login = true
    save!
  end

  def disable_two_factor_authentication
    self.otp_secret = nil
    self.otp_required_for_login = false
    save!
  end

end
