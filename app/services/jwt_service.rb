class JWTService
  def self.encode(payload)
    JWT.encode(payload, ENV["jwt_secret_key"], "HS256")
  end

  def self.decode(token)
    body = JWT.decode(token, ENV["jwt_secret_key"], true, algorithm: "HS256")[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end
end
