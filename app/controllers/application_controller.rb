class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def service_connection
    @service_connection ||= LibraryService.new
  end

  helper_method :service_connection
end
