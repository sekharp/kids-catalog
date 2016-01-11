class LibraryService
  attr_reader :client

  def initialize
    @client ||= Openlibrary::Client.new
  end

end
