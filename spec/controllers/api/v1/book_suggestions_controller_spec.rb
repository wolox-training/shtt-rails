require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #create' do
    context 'when creating a valid book suggestion' do
      let(:user) { create(:user) }
      let!(:book_suggestion_attributes) do
        attributes_with_foreign_keys(:book_suggestion, user: user)
      end
      before do
        post :create, params: { book_suggestion: book_suggestion_attributes }
      end

      it 'create a new book suggestion' do
        book_suggestion_attributes.each_pair do |key, value|
          expect(JSON.parse(response.body)[key]).to eq(value)
        end
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book suggestion' do
      let!(:book_suggestion_attributes) do
        attributes_with_foreign_keys(:book_suggestion, user: nil)
      end
      before do
        post :create, params: { book_suggestion: book_suggestion_attributes }
      end

      it 'doesn\'t create a new book suggestion' do
        expect(JSON.parse(response.body)['id']).to eq(nil)
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
