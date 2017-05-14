class LibraryService
  attr_reader :connection, :cover_connection

  def initialize
    @connection ||= Hurley::Client.new('http://openlibrary.org/')
    @cover_connection ||= Hurley::Client.new('http://covers.openlibrary.org/')
  end

  def book(isbn)
    parse(connection.get("isbn/#{isbn}.json"))
  end

  def cover_url(isbn)
    response = cover_connection.get("b/isbn/#{isbn}-L.jpg")
    if response.header['Content-Type'].nil?
      'http://i.imgur.com/sJ3CT4V.gif'
    else
      "http://covers.openlibrary.org/b/isbn/#{isbn}-L.jpg"
    end
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
