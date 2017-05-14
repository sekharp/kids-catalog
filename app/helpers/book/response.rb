require 'book/item'

# :nocov:
module GoogleBooks
  class Response
    attr_reader :response
    include Enumerable

    def initialize(response)
      @response = response
    end

    # Returns nil if no records are returned. Otherwise, response returns
    # hash of generally unusable Google API specific data.
    def each
      return [] if total_items.zero?
      @response['items'].each do |item|
        yield(Item.new(item))
      end
    end

    # Total items returnable based on query, not total items in response
    # (which is throttled by maxResults)
    def total_items
      @response['totalItems'].to_i
    end
  end
end
# :nocov:
