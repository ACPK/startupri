class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_device_type

  protected

  def set_device_type
    request.variant = :phone if browser.mobile?
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

end