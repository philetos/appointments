class Api::ApplicationController < ApplicationController

  skip_before_filter :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # Handler for urls that are not found
  def not_found
    render json: { error: { message: 'There was nothing found at this address.' }}, status: :not_found
  end

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
end
