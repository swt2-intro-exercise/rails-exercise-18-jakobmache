require 'rails_helper'

describe "Edit author page", type: :feature do

  it "should render withour error" do
    visit edit_author_path
  end
end