shared_context 'Open library request' do
  before do
    stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0451526538&format=json&jscmd=data')
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/open_library_request_success.json'),
        headers: { 'Content-Type': 'application/json' }
      ).then.to_return(
        status: 500,
        body: 'Internal Error',
        headers: { 'Content-Type': 'application/json' }
      ).then.to_timeout
  end
end
