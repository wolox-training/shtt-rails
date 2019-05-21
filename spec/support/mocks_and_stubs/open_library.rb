def open_library_request_success
  stub_request(:get, 'http://openlibrary.org/api/books')
    .to_return(
      status: :ok,
      body: File.read('./spec/support/fixtures/open_library_request_success.json'),
      headers: { 'Content-Type': 'application/json' }
    ).times(1).then.to_raise('External error').then.to_timeout
end

def open_library_request_raise
  stub_request(:get, 'http://openlibrary.org/api/books/raise').to_raise('External error')
end

def open_library_request_timeout
  stub_request(:get, 'http://openlibrary.org/api/books/to').to_timeout
end
