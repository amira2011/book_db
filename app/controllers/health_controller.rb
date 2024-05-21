require "net/http"

class HealthController < ApplicationController
  skip_before_action :authenticate_admin_user!, only: :show

  def show
    health_status = {
      database: database_healthy?,
      cache: cache_healthy?,
      api_service: api_service_healthy?,
    }
    status = health_status.values.all? ? :ok : :service_unavailable
    puts status
    render json: health_status, status: status
  end

  private

  def database_healthy?
    ActiveRecord::Base.connection.execute("SELECT 1")
    true
  rescue StandardError => e
    Rails.logger.error("Database health check failed: #{e.message}")
    false
  end

  def cache_healthy?
    Rails.cache.write("healthcheck", "ok")
    Rails.cache.read("healthcheck") == "ok"
  rescue StandardError => e
    Rails.logger.error("Cache health check failed: #{e.message}")
    false
  end

  def api_service_healthy?
    uri = URI.parse("http://localhost:3004/api/v1/authors")
    response = Net::HTTP.get_response(uri)
    puts response
    response.is_a?(Net::HTTPSuccess)
  rescue StandardError => e
    Rails.logger.error("API service health check failed due to following: #{e.message}")
    false
  end
end
