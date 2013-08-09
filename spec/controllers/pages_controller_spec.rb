require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "POST 'report'" do
    it "returns http success" do
      post 'report'
      response.should be_success
    end
  end
end
