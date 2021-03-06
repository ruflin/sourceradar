require 'spec_helper'

describe TypeOfRule do

  context "when creating a vulnerability impact" do


    let(:valid_params) { { type: "test" } }

    it "needs the required fields" do
      parameters = valid_params
      parameters.each_key do |key|
        TypeOfRule.new(parameters.except(key)).should_not be_valid
      end
    end

    it "needs a unique type" do
      TypeOfRule.create(valid_params)
      TypeOfRule.new(valid_params).should_not be_valid
    end

    it "should create a vulnerability impact with valid parameters" do
      TypeOfRule.new(valid_params).should be_valid
    end

    it "should not create a vulnerability impact with invalid parameters" do
      expect do
        TypeOfRule.new(type: "test", time_to_be_fixed: 1, description: "blaaaa")
        should raise_error
      end
    end

  end

end
