require 'rails_helper'

describe "New author page", type: :feature do

 it "should render withour error" do
   visit new_author_path
 end

 it "should have text inputs for an author's first name, last name, and homepage" do
   visit new_author_path

   # these are the standard names given to inputs by the form builder
   expect(page).to have_field('author[first_name]')
   expect(page).to have_field('author[last_name]')
   expect(page).to have_field('author[homepage]')
 end

  it 'creates an author in the database after submitting the author form' do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click

    expect(Author.count).to eq(1)
  end

  it 'shows an error when not entering a last name' do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[homepage]', with: 'test'
    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end
end