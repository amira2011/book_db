module Api
  class ApiBaseController < ActionController::API
    # Respond to JSON and XML formats
    respond_to :json, :xml
    before_action :verify_jwt_token, except: [:unauthorized]
    # Set default request format to JSON
    before_action :set_default_format

    # Add any other custom methods and configurations as needed
    def unauthorized
      render json: { ok: false, error: "Access denied", status: 401 }
    end

    private

    # Method to set the default format to JSON
    def set_default_format
      request.format = :json
    end

    protected

    def verify_jwt_token
      token = request.headers["Authorization"].split(" ").last if request.headers["Authorization"].present?
      authorized = false
      puts "token is in request #{token}"
      puts "First Token is #{ApiToken.first.token}"

      if token.present?
        @api_token = ApiToken.find_by token: Digest::MD5.hexdigest(token)
        if @api_token.present?
          @api_token.last_accessed_at = Time.now
          @api_token.accessed_by_ips << request.remote_ip unless @api_token.accessed_by_ips.include? request.remote_ip
          @api_token.save

          authorized = true if @api_token.active? && AuthToken.valid?(token)
        end
      end
      redirect_to api_api_unauthorized_path unless authorized
    end
  end
end
