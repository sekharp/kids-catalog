class LibraryService
  attr_reader :connection

  def initialize
    @connection ||= Hurley::Client.new("http://openlibrary.org/")
  end

  def book(isbn)
    parse(connection.get("isbn/#{isbn}.json"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
