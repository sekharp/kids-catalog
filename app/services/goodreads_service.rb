# class GoodreadsService
#   attr_reader :client
#
#   def initialize
#     @client ||= Goodreads::Client.new(:api_key => ENV['GOODREADS_KEY'], :api_secret => ENV['GOODREADS_SECRET'])
#   end
#
#   private
#
#   def parse(response)
#     JSON.parse(response.body, symbolize_names: true)
#   end
# end
