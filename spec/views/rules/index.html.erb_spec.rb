require 'spec_helper'

describe "rules/index" do

  let(:language) { FactoryGirl.create(:language) }

  before(:each) do
    assign(:rules, [
      stub_model(Rule,
        :language => language,
        :expression => "",
        :description => "Description"
      ),
      stub_model(Rule,
        :language => FactoryGirl.create(:language, :another),
        :expression => "",
        :description => "Description"
      )
    ])
  end

  it "renders a list of rules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => language.name
  end
end
