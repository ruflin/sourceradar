require 'spec_helper'

describe Rule do

  let(:language_id) { FactoryGirl.create(:language).id }

  context "when creating a rule" do
    it "needs the required fields" do
      parameters = { keyword: "test", description: "test", language_id: language_id }
      parameters.each_key do |key|
        Rule.new(parameters.except(key)).should_not be_valid
      end
    end

    it "needs a unique keyword" do
      Rule.create(keyword: "test", description: "test", language_id: language_id)
      Rule.new(keyword: "test", description: "blubb", language_id: language_id).should_not be_valid
    end

    it "allows the same keyword in different languages" do
      Rule.create(keyword: "test", description: "test", language_id: FactoryGirl.create(:language, :another).id)
      Rule.new(keyword: "test", description: "blubb", language_id: language_id).should be_valid
    end
  end

end
