require "jwt"
require "figaro"

module AuthToken
  TOKEN = ENV.fetch("auth_token_key", "test")

  def self.issue_token(payload, exp = nil, key = TOKEN)
    payload["exp"] = exp.from_now.to_i unless exp.nil?
    JWT.encode(payload, key)
  end
  def self.valid?(token, key = TOKEN)
    JWT.decode(token, key)
  rescue StandardError
    false
  end
end
