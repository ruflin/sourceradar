require 'spec_helper'

describe "rules/new" do
  before(:each) do
    assign(:rule, stub_model(Rule,
      :language_id => FactoryGirl.create(:language).id,
      :expression => "",
      :description => "MyString",
      :technicalnote => "Tech note",
      :businessnote => "Biz note"
    ).as_new_record)
  end

  it "renders new rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rules_path, "post" do
      assert_select "select#rule_language_id[name=?]", "rule[language_id]"
      assert_select "input#rule_expression[name=?]", "rule[expression]"
      assert_select "textarea#rule_description[name=?]", "rule[description]"
      assert_select "textarea#rule_technicalnote[name=?]", "rule[technicalnote]"
      assert_select "textarea#rule_businessnote[name=?]", "rule[businessnote]"
    end
  end
end
