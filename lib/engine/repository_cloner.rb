require 'grit'
include Grit

module Engine
  class RepositoryCloner

    def initialize(url, branch, working_dir = '/tmp/ponies')
      @working_dir = working_dir
      #clone repo with the url
      @repo = Grit::Git.new(@working_dir)
      clone!(url, branch)
      #checkout to the branch
    end

    def repo_size
      Dir.entries(@working_dir).size
    end

    private

    def clone!(url, branch)
      @repo.clone({:branch => branch}, url , @working_dir)
    end

  end
end