require 'rails_helper'

describe "Edit paper page", type: :feature do

  let(:paper) { FactoryBot.create :paper }

  it 'should show a select multiple box for the authors' do
    visit edit_paper_path(paper)

    expect(page).to have_css('select[multiple]')
  end

  it 'should save the new authors after selecting them' do
    alan = FactoryBot.create :author, first_name: 'Alan', last_name: 'Turings'
    peter = FactoryBot.create :author, first_name: 'Peter', last_name: 'Plagiarist'
    paper.authors << alan
    paper.save

    visit edit_paper_path(paper)

    find('select[multiple]').select peter.name
    find('input[type="submit"]').click

    expect(paper.authors).to include(peter)
  end
end