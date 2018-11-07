require 'rails_helper'

describe "Index author page", type: :feature do

  it "should render withour error" do
    @alan = FactoryBot.create :author

    visit authors_path

    expect(page).to have_link 'New', href: new_author_path
    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')
  end

  it 'should show a link to the author edit page' do
    @alan = FactoryBot.create :author

    visit authors_path

    expect(page).to have_link 'Edit', href: edit_author_path(@alan)
  end
end