require 'spec_helper'
require 'engine'
require 'ostruct'

include Engine
describe Engine::RepositoryService do



  let(:empty_url) { nil }
  let(:non_github_url) { "blalalaal" }
  let(:username) { "centralway" }
  let(:valid_repo_name) { "sourceradar" }
  let(:invalid_repo_name) { "skfhjsldjfsldkjf" }
  let(:invalid_url) { "https://github.com/#{username}/#{invalid_repo_name}.git" }
  let(:valid_url) { "https://github.com/#{username}/#{valid_repo_name}.git" }
  let(:valid_branch) { "development" }
  let(:invalid_branch) { "thisdoesntexistdude" }

  before { RepositoryCloner.stub(:new).with(any_args).and_return(anything)}
  before {}

  describe "is_valid_url?" do

  #  let(:repo_with_valid_url) { RepositoryService.new(valid_url, valid_branch) }
    let(:repo_with_invalid_url) { RepositoryService.new(invalid_url, valid_branch) }
    let(:repo_with_invalid_github_url) { RepositoryService.new(non_github_url, nil) }

    it "should return true on valid URL" do

      repo_with_valid_url = RepositoryService.new(valid_url, valid_branch)

      repo_with_valid_url.stub(:branch_exists?).and_return(true)
      repo_with_valid_url.stub(:send_to_engine).with(any_args)



      @valid_response = double().as_null_object
      @valid_response.should_receive(:code).and_return(200)
      HTTParty.should_receive(:get).with(valid_url).ordered.and_return(@valid_response)
      expect(repo_with_valid_url.is_valid_url?).to be_eql(true)
    end

    it "should raise error on invalid URL" do

      expect{repo_with_invalid_url}.to raise_error("The link you submitted is invalid")
    end

    it "should raise error on invalid github URL" do
=begin
      repo_with_invalid_github_url.stub(:branch_exists?).and_return(true)
      @invalid_response = double().as_null_object
      @invalid_response.should_receive(:code).and_return(404)
      HTTParty.should_receive(:get).once.with(non_github_url).and_return(@invalid_response)
=end
      expect{repo_with_invalid_github_url}.to raise_error("The link you submitted is invalid")
    end

  end

  describe "branch_exists?" do

    let(:repo_with_valid_branch) { RepositoryService.new(valid_url, valid_branch) }
    let(:repo_with_invalid_branch) { RepositoryService.new(valid_url, invalid_branch) }
    let(:repo_with_empty_branch) { RepositoryService.new(valid_url, nil) }

    it "should return true on valid branch" do

      branch_url =  "https://api.github.com/repos/#{username}/#{valid_repo_name}/branches"

      @valid_response = OpenStruct.new(:body => '[
          {
          "name": "' + valid_branch + '",
          "commit": {
            "sha": "30e2534c4e756a27583111f3d372850b62a1c844",
            "url": "https://api.github.com/repos/centralway/sourceradar/commits/30e2534c4e756a27583111f3d372850b62a1c844"
          }
        }
      ]')

      HTTParty.should_receive(:get).once.ordered.with(valid_url).and_return(OpenStruct.new(:code => 200))
      HTTParty.should_receive(:get).twice.ordered.with(branch_url).and_return(@valid_response)

      #TODO: Remove the left-over call to the REAL Github API here. :(
      repo_with_valid_branch.stub(:is_valid_url?).and_return(true)
      repo_with_valid_branch.get_user_and_repo(valid_url)

      expect(repo_with_valid_branch.branch_exists?).to be_true
    end

    it "should raise error on invalid branch" do
    #  repo_with_invalid_branch.stub(:is_valid_url?).and_return(true)
    #  branch_url = valid_url.chomp('.git') + '/branches/' + invalid_branch
    #  @invalid_response = double().as_null_object
    #  @invalid_response.should_receive(:code).and_return(404)
    #  HTTParty.should_receive(:get).once.with(branch_url).and_return(@invalid_response)
      expect{repo_with_invalid_branch}.to raise_error("The submitted branch doesn't exist")
    end

    it "should not raise exception from HTTParty" do
      repo_with_valid_branch.stub(:is_valid_url?).and_return(true)
      repo_with_valid_branch.stub(:branch_exists?).once.ordered.and_return(true)
      repo_with_valid_branch.stub(:send_to_engine).with(any_args)

      HTTParty.stub(:get).and_raise("OH MY GOD!")

      branch_url = valid_url.chomp('.git') + '/branches/'
      expect(repo_with_valid_branch.branch_exists?).not_to raise_error
    end

    it "should return false on exception from HTTParty" do
      repo_with_empty_branch.stub(:is_valid_url?).and_return(true)
      branch_url = valid_url.chomp('.git') + '/branches/'
      repo_with_empty_branch.stub(:send_to_engine).with(any_args)
      http_mock = HTTParty.stub(:get).and_raise("OH MY GOD!")
      expect(repo_with_empty_branch.branch_exists?).to be_eql(false)
    end

  end

  describe "get_user_and_repo" do
    it "should ... you know. HAVE TESTS" do
      pending "WHOAH!"
    end
  end


  context "crop should remove .git from URLs" do

    let(:url_with_dot_git) { "https://github.com/centralway/sourceradar.git" }
    let(:url_without_dot_git) { "https://github.com/centralway/sourceradar" }


    it "should remove .git from the url" do
      repo_with_valid_url = RepositoryService.new(valid_url, valid_branch)
      result = repo_with_valid_url.chop_url(url_with_dot_git)
      expect(result).to eq(url_without_dot_git)
    end


    it "should not change the url without .git" do
      repo_with_valid_url = RepositoryService.new(valid_url, valid_branch)
      result = repo_with_valid_url.chop_url(url_with_dot_git)
      expect(result).to eq(url_without_dot_git)
    end


  end




  context "should call the engine to analyse the repo" do

    let(:repo_with_valid_url) { RepositoryService.new(valid_url, nil) }
    let(:user) {"centralway"}
    let(:repository) {"sourceradar"}

    it "with valid branch" do

      RepositoryCloner.stub(:new).with(any_args).and_return(anything)

      repo_cloner = repo_with_valid_url.send_to_engine(user, repository, valid_branch)

      expect(repo_cloner).not_to be_nil
    end

    it "with blank branch" do

      RepositoryCloner.stub(:new).with(any_args).and_return(anything)

      repo_cloner = repo_with_valid_url.send_to_engine(user, repository, nil)

      expect(repo_cloner).not_to be_nil
    end


  end




end