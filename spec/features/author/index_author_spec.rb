require 'rails_helper'

describe "Index author page", type: :feature do

  before do
    @alan = FactoryBot.create :author
  end

  it "should render withour error" do
    visit authors_path

    expect(page).to have_link 'New', href: new_author_path
    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')
  end

  it 'should show a link to the author edit page' do
    visit authors_path

    expect(page).to have_link 'Edit', href: edit_author_path(@alan)
  end

  it 'should show a delete link for each author' do
    visit authors_path

    expect(page).to have_link 'Destroy', href: author_path(@alan)
  end

  it 'should not show an error when clicking the delete link' do
    visit authors_path
    click_on 'Destroy'

  end
end