require 'test/unit'
require 'mocha/setup'
require_relative '../../lib/engine'

class TestRepositoryCloner < Test::Unit::TestCase

    @url = "https://github.com/centralway/sourceradar.git"
    @branch = "master"

    def test_initialize_creates_instance
      repo = Engine::RepositoryCloner.new(@url,@branch)
      assert_not_nil repo.nil?
    end

    def test_initialize_creates_git_instance

      grit_mock = mock()
      grit_mock.expects(:clone).with(any_parameters)
      Grit::Git.expects(:new).with('/tmp/filling-in').returns(grit_mock)

      Engine::RepositoryCloner.new(@url, @branch)
    end

    def test_initialize_clones_repo
      grit_mock = mock()
      grit_mock.expects(:clone).with({:branch => anything}, @url, '/tmp/myrepo')

      Grit::Git.expects(:new).returns(grit_mock)

      Engine::RepositoryCloner.new(@url, @branch)
    end

    def test_initialize_checkout_branch
      grit_mock = mock()
      grit_mock.expects(:clone).with(any_parameters)
      Grit::Git.expects(:new).with('/tmp/filling-in').returns(grit_mock)


      Engine::RepositoryCloner.new(@url, @branch)
    end

end