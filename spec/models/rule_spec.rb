require 'spec_helper'

describe Rule do

  context "when creating a rule" do
    it "needs the required fields" do
      parameters = { expression: "test", description: "test" }
      parameters.each_key do |key|
        Rule.new(parameters.except(key)).should_not be_valid
      end
    end

    it "needs a unique keyword" do
      Rule.create(expression: "test", description: "test")
      Rule.new(expression: "test", description: "blubb").should_not be_valid
    end

    it "should create a rule with valid parameters" do
      Rule.new(expression: "test", description: "abc", businessnote: "Business", technicalnote: "Technical").should be_valid
    end

  end

end
