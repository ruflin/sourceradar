require 'spec_helper'

describe "rules/show" do
  before(:each) do
    @rule = assign(:rule, stub_model(Rule,
      :language_id => FactoryGirl.create(:language).id,
      :keyword => "",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Description/)
  end
end
