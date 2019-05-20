class OpenLibrary
  include HTTParty
  base_uri 'https://openlibrary.org'

  def initialize(isbn)
    @isbn = "ISBN:#{isbn}"
    @options = { query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' } }
  end

  def books
    process_response self.class.get('/api/books', @options)
  end

  def process_response(response)
    result = { ISBN: @isbn }
    response_body = JSON.parse(response.body)
    result[:title] = response_body[@isbn]['title']
    result[:subtitle] = response_body[@isbn]['subtitle']
    result[:number_of_pages] = response_body[@isbn]['number_of_pages']
    result[:authors] = response_body[@isbn]['authors']
    result
  end
end
