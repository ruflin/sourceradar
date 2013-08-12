require 'grit'
include Grit

module Engine
  class RepositoryCloner

    def initialize(url, branch, working_dir = '/tmp/ponies2')
      @working_dir = working_dir

      #if the branch is nil then find the default branch
      @repo = Grit::Git.new(@working_dir)
      if branch.blank?
        @branch = find_default_branch(url)
      else
       @branch = branch
      end

      #clone repo with the url
      clone!(url, @branch)

    end

    def repo_size
      Dir.entries(@working_dir).size
    end

    def find_default_branch(url)

      s_url = url.split('/')
      user = s_url[3]
      repository = s_url[4]
      response = HTTParty.get("https://api.github.com/repos/"+user+"/"+repository)
      response_hash = JSON.parse(response.body)
      response_hash['default_branch']
    end

    private

    def clone!(url, branch)
      @repo.clone({:branch => branch}, url , @working_dir)
    end



  end
end