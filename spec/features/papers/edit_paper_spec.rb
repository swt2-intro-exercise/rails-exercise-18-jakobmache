require 'rails_helper'

describe "Edit paper page", type: :feature do

  let(:paper) { FactoryBot.create :paper }

  it 'should show a select multiple box for the authors' do
    visit edit_paper_path(paper)

    expect(page).to have_css('select[multiple]')
  end
end