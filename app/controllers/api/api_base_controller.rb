module Api
  class ApiBaseController < ActionController::API
    # Respond to JSON and XML formats
    respond_to :json, :xml

    # Set default request format to JSON
    before_action :set_default_format

    # Add any other custom methods and configurations as needed

    private

    # Method to set the default format to JSON
    def set_default_format
      request.format = :json
    end
  end
end
