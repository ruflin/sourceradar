require 'spec_helper'
require 'engine'

describe Engine::RepositoryCloner do

  let(:user) { "centralway" }
  let(:repository) { "sourceradar" }
  let(:valid_branch) { "development" }

  let(:invalid_branch) { "bleurgh" }


  let(:blank_branch) { "" }

  subject { Engine::RepositoryCloner.new(user, repository, valid_branch) }

  it "should create an instance" do
    grit_stub = double()
    grit_stub.should_receive(:clone)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    should_not be_nil
  end

  it "should clone the repository" do
    grit_stub = double()
    grit_stub.should_receive(:clone)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)
    Engine::RepositoryCloner.new(user, repository,valid_branch)

  end

  it "should raise exception with an invalid branch" do
    grit_stub = double()
    grit_stub.should_receive(:clone)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    Engine::RepositoryCloner.new(user, repository, invalid_branch)

  end

  it "should clone the repository with the default branch if a blank branch is given" do

    grit_stub = double()
    grit_stub.should_receive(:clone)
    Grit::Git.should_receive(:new).with(any_args()).and_return(grit_stub)

    Engine::RepositoryCloner.new(user, repository, blank_branch)
  end

end