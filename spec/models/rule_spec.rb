require 'spec_helper'

describe Rule do

  context "when creating a rule" do

    let(:language) { FactoryGirl.create(:language) }
    let(:type_of_rule) { FactoryGirl.create(:type_of_rule) }
    let(:valid_params) { { expression: "test", businessnote: "test", technicalnote:"test", language_id: language.id, type_of_rule_id: type_of_rule.id } }

    it "needs the required fields" do
      parameters = valid_params
      parameters.each_key do |key|
        Rule.create(parameters.except(key)).should_not be_valid
      end
    end

    it "needs a unique expression" do
      Rule.create(valid_params)
      Rule.new(valid_params).should_not be_valid
    end

    it "should create a rule with valid parameters" do
      Rule.new(valid_params).should be_valid
    end

  end

end
