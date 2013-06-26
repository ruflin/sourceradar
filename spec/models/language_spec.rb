require 'spec_helper'

describe Language do
  context "when creating a language" do

    it "needs a name" do
      lambda { Language.create!() }.should raise_error
    end

    it "needs a unique name" do
      Language.create!(name: "Java")

      lambda { Language.create!(name: "Java") }.should raise_error
      puts Language.count
    end
  end
end
