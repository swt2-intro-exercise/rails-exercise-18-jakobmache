require 'rails_helper'

describe "Show author page", type: :feature do

  it "should render withour error" do
    @alan = FactoryBot.create :author

    visit author_path(@alan)

    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')
  end
end