class Api::ApplicationController < ApplicationController

  skip_before_filter :verify_authenticity_token

  rescue_from Exception, with: :system_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def api_authentication_required
    access_key = AccessKey.find_by_token(params[:token])

    unless access_key
      render json: { error: { message: 'This request requires authentication.' }}, status: :unauthorized and return
    end
  end

  # Called if an ActiveRecord::RecordNotFound error is raised to return a proper json response
  def record_not_found
    render json: { error: { message: 'Record not found.' }}, status: :not_found
  end

  # Custom 500 error message if any other non-caught exceptions are raised during a request
  def system_error(exception)
    logger.error("  --------------------------------------------------------------")
    logger.error("  SYSTEM ERROR FOUND: #{exception.message}")
    logger.error("  --------------------------------------------------------------")

    exception.backtrace.take(15).each do |trace|
      logger.error("    #{trace}")
    end

    logger.error("   --------------------------------------------------------------\n\n")

    render json: { error: { message: 'System error.' }}, status: :internal_server_error
  end
end
