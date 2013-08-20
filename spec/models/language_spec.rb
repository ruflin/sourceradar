require 'spec_helper'

describe Language do

  context "when creating a language" do

    it "needs the required fields" do
      parameters = { name: "Java", file_extension: ".java" }
      parameters.each_key do |key|
        Language.new(parameters.except(key)).should_not be_valid
      end
    end

    it "needs a unique name" do
      Language.create(name: "Java", file_extension: ".java")
      Language.new(name: "Java", file_extension: "blubb").should_not be_valid
    end

    it "needs a unique file_extension" do
      Language.create(name: "Java", file_extension: ".java")
      Language.new(name: "blaaa", file_extension: ".java").should_not be_valid
    end

    it "should create a language with valid parameters" do
      Language.create(name: "Java", file_extension: ".java").should be_valid
    end

    it "should not create a language with invalid parameters" do
      expect do
        Language.new(name: "Java", file_extension: ".java", description: "blaaaa")
        should raise_error
      end
    end

  end

end
