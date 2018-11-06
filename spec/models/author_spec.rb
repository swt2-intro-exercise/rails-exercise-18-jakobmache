require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { Author.new first_name: 'Alan', last_name: 'Turing', homepage: 'https://wikipedia.org/Alan_Turing' }

  describe :create do
    it 'creates an author successfully' do
      expect(author.first_name).to eq('Alan')
      expect(author.last_name).to eq('Turing')
      expect(author.homepage).to eq('https://wikipedia.org/Alan_Turing')
    end

    context 'when last name is missing' do
      it 'fails the validation' do
        author = Author.new first_name: 'Peter', homepage: 'abc'
        expect(author).to_not be_valid
      end
    end
  end

  describe :name do
    it 'returns first name and last name' do
      expect(author.name).to eq('Alan Turing')
    end
  end
end
