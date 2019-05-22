require 'rails_helper'

describe Api::V1::OpenLibraryController do
  describe 'GET #show' do
    context 'When fetching the book info' do
      include_context 'Authenticated User'
      @json_res = File.read('./spec/support/fixtures/show_open_library_controller_success.json')

      before do
        stubbed_service = instance_double(OpenLibrary)
        allow(stubbed_service).to receive(:books).and_return(@json_res)
        allow(OpenLibrary).to receive(:new).and_return(stubbed_service)
        get :show, params: { isbn: '0451526538' }
      end

      it 'response with book info json' do
        expect(response.body) == @json_res
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When a raise error' do
      include_context 'Authenticated User'
      before do
        stubbed_service = instance_double(OpenLibrary)
        allow(stubbed_service).to receive(:books).and_raise
        allow(OpenLibrary).to receive(:new).and_return(stubbed_service)
        get :show, params: { isbn: '0451526538' }
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
