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
      authorized = false
      #redirect_to api_api_unauthorized_path unless authorized
    end
  end
end
