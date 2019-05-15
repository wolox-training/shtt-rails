require 'rails_helper'

describe Api::V1::BooksController do
  context 'When user is autenticated' do
    include_context 'Authenticated User'

    describe 'GET #index' do
      context 'When fetching all the books' do
        let!(:books) { create_list(:book, 3) }

        before do
          get :index
        end

        it 'responses with the books json' do
          expect(JSON.parse(response.body)).to be_paginated
        end

        it 'responds with 200 status' do
          expect(response).to have_http_status(:ok)
        end
      end
    end

    describe 'GET #show' do
      context 'When fetching a book' do
        let!(:book) { create(:book) }

        before do
          get :show, params: { id: book.id }
        end

        it 'responses with the book json' do
          expect(response.body).to eq ShowBookSerializer.new(
            book, root: false
          ).to_json
        end

        it 'responds with 200 status' do
          expect(response).to have_http_status(:ok)
        end

        it 'responds with 404 status' do
          get :show, params: { id: 2 }
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end

  context 'When user is not authenticate' do
    describe 'GET #index' do
      context 'When fetching all the books' do
        let!(:books) { create_list(:book, 3) }
      end

      before do
        get :index
      end

      it 'responds with 401 status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET #show' do
      context 'When fetching a book' do
        let!(:book) { create(:book) }

        before do
          get :show, params: { id: book.id }
        end

        it 'responds with 401 status' do
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
