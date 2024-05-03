class AddOtpRequiredForLoginToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :otp_required_for_login, :boolean
  end
end
