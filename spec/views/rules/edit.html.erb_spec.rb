require 'spec_helper'

describe "rules/edit" do
  before(:each) do
    @rule = assign(:rule, stub_model(Rule,
      :expression => "",
      :description => "MyString",
      :technicalnote => "",
      :businessnote => ""
    ))
  end

  it "renders the edit rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rule_path(@rule), "post" do
      assert_select "input#rule_expression[name=?]", "rule[expression]"
      assert_select "textarea#rule_description[name=?]", "rule[description]"
      assert_select "textarea#rule_technicalnote[name=?]", "rule[technicalnote]"
      assert_select "textarea#rule_businessnote[name=?]", "rule[businessnote]"
    end
  end
end
