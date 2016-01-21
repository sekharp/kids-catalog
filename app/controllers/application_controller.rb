class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :service_connection, :googlebooks, :parse

  def service_connection
    @service_connection ||= LibraryService.new
  end

  # :nocov:
  def googlebooks(isbn)
    GoogleBooks.search(isbn).response
  end
  # :nocov:

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
