require 'spec_helper'

describe "rules/index" do

  before(:each) do
    assign(:rules, [
      stub_model(Rule,
        :expression => "",
        :technicalnote => "Tech note",
        :businessnote => "Biz note"
      ),
      stub_model(Rule,
        :expression => "",
        :technicalnote => "Tech note",
        :businessnote => "Biz note"
      )
    ])
  end

  it "renders a list of rules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
