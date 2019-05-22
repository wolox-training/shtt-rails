require 'rails_helper'
require 'httparty'

describe OpenLibrary do
  context 'When call open library service' do
    include_context 'Open library request'

    context 'When fetching book info' do
      url = 'https://openlibrary.org/api/books?bibkeys=ISBN:0451526538&format=json&jscmd=data'
      before do
        OpenLibrary.new('0451526538').books
      end

      it 'response with the book info json' do
        expect(WebMock).to have_requested(:get, url).once
      end
    end

    context 'When raise an error' do
      it 'response with the book info json' do
        expect do
          OpenLibrary.new('0451526538').books
          OpenLibrary.new('0451526538').books
        end.to raise_error(StandardError, 'External error')
      end
    end

    context 'When request timeout' do
      it 'response with the book info json' do
        expect do
          OpenLibrary.new('0451526538').books
          OpenLibrary.new('0451526538').books
          OpenLibrary.new('0451526538').books
        end.to raise_error(RuntimeError, 'External error')
      end
    end
  end
end
