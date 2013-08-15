require 'spec_helper'

describe "Home page", :type => :feature do

  before(:each) do
    visit '/'
  end

  describe "Submit button" do

    it "should return error for an empty repo input field" do
      click_button('Submit')
      page.should have_content("Please provide a URL")
    end

    it "should return error for a invalid link" do
      fill_in 'pages[link]', :with => 'https://github.com/centralway/bleruuuuuugh'
      click_button('Submit')
      page.should have_content("The link you submitted is invalid")
    end


    it "should return error for a non existing branch input field" do
      fill_in 'pages[link]', :with => 'https://github.com/centralway/sourceradar'
      fill_in 'pages[branch]', :with => 'dev'
      click_button('Submit')
      page.should have_content("The submitted branch doesn't exist")
    end

    it "should tell about success if everything worked" do
      pending "Yeah, find some nice words to tell the user we rock"
    end
  end

end
