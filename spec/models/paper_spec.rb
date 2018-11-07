require 'rails_helper'

RSpec.describe Paper, type: :model do
  describe :create do
    context 'when title is missing' do
      let(:paper) { Paper.new venue: 'Test', year: 2010 }

      it 'fails the validation' do
        expect(paper).to_not be_valid
      end
    end

    context 'when venue is missing' do
      let(:paper) { Paper.new title: 'Test', year: 2010 }

      it 'fails the validation' do
        expect(paper).to_not be_valid
      end
    end

    context 'when year is missing' do
      let(:paper) { Paper.new title: 'Test', venue: 'Test' }

      it 'fails the validation' do
        expect(paper).to_not be_valid
      end
    end

    context 'when year is not a number' do
      let(:paper) { Paper.new title: 'Test', venue: 'Test', year: 'nineteen-fifty' }

      it 'fails the validation' do
        expect(paper).to_not be_valid
      end
    end
  end

  it 'should have an author list' do
    paper = FactoryBot.create :paper
    expect(paper.authors).to_not be_nil
  end
end
