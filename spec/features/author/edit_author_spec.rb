require 'rails_helper'

describe "Edit author page", type: :feature do

  let(:author) { FactoryBot.create :author }

  it "should render withour error" do
    visit edit_author_path(author)
  end
end