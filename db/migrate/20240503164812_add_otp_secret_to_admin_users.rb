class AddOtpSecretToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :otp_secret, :string
  end
end
