require 'spec_helper'

describe RepositoryService do

  let(:empty_url) { nil }
  let(:non_github_url) { "blalalaal" }
  let(:invalid_url) { "https://github.com/centralway/whoopwhoop" }
  let(:valid_url) { "https://github.com/centralway/sourceradar.git" }
  let(:valid_branch) { "development" }
  let(:invalid_branch) { "thisdoesntexistdude" }

  describe "is_valid_url?" do

    let(:repo_with_valid_url) { RepositoryService.new(valid_url, nil) }
    let(:repo_with_invalid_url) { RepositoryService.new(invalid_url, nil) }
    let(:repo_with_invalid_github_url) { RepositoryService.new(non_github_url, nil) }

    it "should return true on valid URL" do
      @valid_response = double().as_null_object
      @valid_response.should_receive(:code).and_return(200)
      HTTParty.should_receive(:get).once.with(valid_url).and_return(@valid_response)
      expect(repo_with_valid_url.is_valid_url?).to be_eql(true)
    end

    it "should return false on invalid URL" do
      @invalid_response = double().as_null_object
      @invalid_response.should_receive(:code).and_return(404)
      HTTParty.should_receive(:get).once.with(invalid_url).and_return(@invalid_response)
      expect(repo_with_invalid_url.is_valid_url?).to be_eql(false)
    end

    it "should return false on invalid github URL" do
      @invalid_response = double().as_null_object
      @invalid_response.should_receive(:code).and_return(404)
      HTTParty.should_receive(:get).once.with(non_github_url).and_return(@invalid_response)
      expect(repo_with_invalid_github_url.is_valid_url?).to be_eql(false)
    end

  end

  describe "branch_exists?" do

    let(:repo_with_valid_branch) { RepositoryService.new(valid_url, valid_branch) }
    let(:repo_with_invalid_branch) { RepositoryService.new(valid_url, invalid_branch) }
    let(:repo_with_empty_branch) { RepositoryService.new(valid_url, nil) }

    it "should return true on valid branch" do

      branch_url = valid_url.chomp('.git') + '/branches/' + valid_branch

      @valid_response = double().as_null_object
      @valid_response.should_receive(:code).and_return(200)
      HTTParty.should_receive(:get).once.with(branch_url).and_return(@valid_response)
      expect(repo_with_valid_branch.branch_exists?).to be_eql(true)
    end

    it "should return false on invalid branch" do
      branch_url = valid_url.chomp('.git') + '/branches/' + invalid_branch
      @invalid_response = double().as_null_object
      @invalid_response.should_receive(:code).and_return(404)
      HTTParty.should_receive(:get).once.with(branch_url).and_return(@invalid_response)
      expect(repo_with_invalid_branch.branch_exists?).to be_eql(false)
    end

    it "should return true on empty branch" do
      branch_url = valid_url.chomp('.git') + '/branches/'
      @valid_response = double().as_null_object
      @valid_response.should_receive(:code).and_return(200)
      HTTParty.should_receive(:get).once.with(branch_url).and_return(@valid_response)
      expect(repo_with_empty_branch.branch_exists?).to be_eql(true)
    end
  end



  context "crop should remove .git from URLs" do

    let(:url_with_dot_git) { "blabla.git" }
    let(:url_without_dot_git) { "blabla" }

    subject { RepositoryService.new(url_with_dot_git,nil) }
    specify do
      expect(subject.chopUrl(url_with_dot_git)).to be_eql(url_without_dot_git)
    end

    subject { RepositoryService.new(url_without_dot_git,nil) }
    specify do
      expect(subject.chopUrl(url_without_dot_git)).to be_eql(url_without_dot_git)
    end


  end




  context "should call the engine to analyse the repo" do

    let(:repo_with_valid_url) { RepositoryService.new(valid_url, nil) }

    it "with valid branch" do

      repo_cloner = repo_with_valid_url.send_to_engine(valid_url, valid_branch)

      expect(repo_cloner).not_to be_nil
    end

    it "with blank branch" do

      repo_cloner = repo_with_valid_url.send_to_engine(valid_url, nil)

      expect(repo_cloner).not_to be_nil
    end



  end
end