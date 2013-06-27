require 'spec_helper'

describe "rules/edit" do
  before(:each) do
    @rule = assign(:rule, stub_model(Rule,
      :language_id => FactoryGirl.create(:language).id,
      :keyword => "",
      :description => "MyString"
    ))
  end

  it "renders the edit rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rule_path(@rule), "post" do
      assert_select "select#rule_language_id[name=?]", "rule[language_id]"
      assert_select "input#rule_keyword[name=?]", "rule[keyword]"
      assert_select "textarea#rule_description[name=?]", "rule[description]"
    end
  end
end
