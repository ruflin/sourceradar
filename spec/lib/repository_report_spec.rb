require 'spec_helper'
require 'engine'

include Engine
describe Engine::RepositoryReport do

  context "return_external_json" do

    let(:internal_json)  {{:project_name => "Sourceradar", :review_date => DateTime.new(2000), :review_id => 2  }}
    let(:response) { RepositoryReport.new(internal_json).body }


    describe "with report information" do

      let(:project_name) { "Sourceradar" }



      it "should return a json with the name of the project" do

       # expect(response['project_name']).to be_eql(project_name)
        pending "will be tested when the RepositoryAnalyser is implemented"
      end



      it "should  return a json with the date of the report" do

      # expect(response['review_date']).to be_eql(DateTime.new(2000))
        pending "will be tested when the RepositoryAnalyser is implemented"
      end

      it "should  return a json with the id of the report" do

      #expect(response['review_id']).to be_eql(2)
        pending "will be tested when the RepositoryAnalyser is implemented"
      end



    end

    describe "with vulnerability information" do

      it "should return a json with the number of critical vulnerabilities" do
        pending "will be tested when the RepositoryAnalyser is implemented"
      end




      it "should  return a json with the number of medium vulnerabilities" do
      pending "will be tested when the RepositoryAnalyser is implemented"
      end


      it "should  return a json with the number of low vulnerabilities" do
      pending "will be tested when the RepositoryAnalyser is implemented"
      end


    end



    end
  end




