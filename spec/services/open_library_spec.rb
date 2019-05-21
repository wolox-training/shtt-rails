require 'rails_helper'
require 'httparty'

describe OpenLibrary do
  context 'When fetching book info' do
    before do
      HTTParty.get('http://openlibrary.org/api/books')
    end

    it 'response with the book info json' do
      expect(WebMock).to have_requested(:get, 'openlibrary.org/api/books').once
    end
  end

  context 'When raise an error' do
    it 'response with the book info json' do
      expect do
        HTTParty.get('http://openlibrary.org/api/books/raise')
      end.to raise_error(StandardError, 'External error')
    end
  end

  context 'When request timeout' do
    it 'response with the book info json' do
      expect do
        HTTParty.get('http://openlibrary.org/api/books/to')
      end.to raise_error(Net::OpenTimeout, 'execution expired')
    end
  end
end
