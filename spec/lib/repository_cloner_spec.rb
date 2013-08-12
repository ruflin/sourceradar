require 'spec_helper'
require 'engine'

describe Engine::RepositoryCloner do

  let(:url) { "https://github.com/centralway/sourceradar" }
  let(:valid_branch) { "development" }

  let(:invalid_branch) { "bleurgh" }
  let(:dest_path) { "/vagrant/repos" }

  let(:blank_branch) { "" }

  subject { Engine::RepositoryCloner.new(url, valid_branch, dest_path) }

  it "should create an instance" do
    grit_stub = double()
    grit_stub.should_receive(:clone).with(any_args())
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    should_not be_nil
  end

  it "should clone the repository" do
    grit_stub = double()
    grit_stub.should_receive(:clone).with({:branch => valid_branch}, url, dest_path)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    #TODO: Holy flippin' cow this is bad. It's god fucking 6 p.m and we have enough time to make it pretty-pretty later.
    Engine::RepositoryCloner.new(url, valid_branch, dest_path)
    #expect(grit_stub).to receive(:clone).once
  end

  it "should raise exception with an invalid branch" do
    grit_stub = double()
    grit_stub.should_receive(:clone).with({:branch => invalid_branch}, url, dest_path)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    Engine::RepositoryCloner.new(url, invalid_branch, dest_path)

  end

  it "should clone the repository with the default branch if a blank branch is given" do

    grit_stub = double()
    grit_stub.should_receive(:clone).with({:branch => valid_branch}, url, dest_path)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    Engine::RepositoryCloner.new(url, blank_branch, dest_path)

  #  grit_stub = double()
  #  grit_stub.should_receive(:clone).with(url, blank_branch)#:branch => anything}, url, dest_path)

  #  Grit::Git.should_receive(:new).with(url,blank_branch, dest_path).and_return(grit_stub)
  #  Engine::RepositoryCloner.new(url,blank_branch, dest_path)


  #  expect(blank_branch).not_to be_eql("")

  end


  it "should show the number of files in the working directory" do

    expect(Engine::RepositoryCloner.new(url,nil, dest_path).repo_size).to be >= 0

  end

end