class HomeController < ApplicationController
  def index
    @service = service_connection.client.book('OL10735300M')
  end
end
