class ApiToken < ApplicationRecord
  serialize :accessed_by_ips, coder: YAML, type: Array

  attr_accessor :new_token

  scope :active, -> { where(is_active: true) }
  before_create :assign_token

  def self.ransackable_attributes(auth_object = nil)
    ["accessed_by_ips", "created_at", "id", "id_value", "is_active", "last_accessed_at", "name", "token", "updated_at"]
  end

  def active?
    is_active
  end

  def activate!
    update_attribute(:is_active, true)
  end

  def deactivate!
    update_attribute(:is_active, false)
  end

  private

  def assign_token
    self.new_token = AuthToken.issue_token(name:)
    self.token = Digest::MD5.hexdigest(new_token)
  end
end
