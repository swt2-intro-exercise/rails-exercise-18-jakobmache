require 'rails_helper'

describe "Edit author page", type: :feature do

  let(:author) { FactoryBot.create :author }

  it "should render withour error" do
    visit edit_author_path(author)
  end

  it 'should update the author object in the database' do
    visit edit_author_path(author)
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Mathison'
    find('input[type="submit"]').click

    author.reload

    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Mathison')
  end
end