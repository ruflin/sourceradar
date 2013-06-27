require 'spec_helper'

describe "rules/new" do
  before(:each) do
    assign(:rule, stub_model(Rule,
      :language_id => FactoryGirl.create(:language).id,
      :keyword => "",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rules_path, "post" do
      assert_select "select#rule_language_id[name=?]", "rule[language_id]"
      assert_select "input#rule_keyword[name=?]", "rule[keyword]"
      assert_select "textarea#rule_description[name=?]", "rule[description]"
    end
  end
end
