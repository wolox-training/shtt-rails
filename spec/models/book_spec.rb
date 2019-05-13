require 'rails_helper'

describe Book do
  subject(:book) { build(:book) }

  it { is_expected.to be_valid }

  context 'When the book is created' do
    it 'create a new book' do
      book.save!
      expect(book.id).to be_present
    end
  end
end
