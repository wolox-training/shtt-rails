class OpenLibrary
  include HTTParty
  base_uri 'https://openlibrary.org'

  def initialize(isbn)
    @isbn = "ISBN:#{isbn}"
    @options = { query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' } }
  end

  def books
    response = self.class.get('/api/books', @options)
    raise 'External error' if response.code != 200

    process_response response
  end

  def process_response(response)
    result = Hash.new('Don\t exists')
    response_body = JSON.parse(response.body)
    unless response_body.empty?
      result = response_body[@isbn]
               .slice('title', 'subtitle', 'number_of_pages', 'authors')
               .merge(ISBN: @isbn)
    end
    result
  end
end
