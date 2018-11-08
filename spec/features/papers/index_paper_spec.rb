require 'rails_helper'

describe "Index paper page", type: :feature do

  let!(:paper1950) { FactoryBot.create :paper, year: 1950, title: 'Old paper' }
  let!(:paper1968) { FactoryBot.create :paper, year: 1968, title: 'New paper' }

  it "should show only papers of the selected year" do
    visit "#{papers_path.to_s}?year=1950"

    expect(page).to have_text('Old paper')
    expect(page).to_not have_text('New paper')
  end
end