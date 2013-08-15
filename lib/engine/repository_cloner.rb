require 'grit'
include Grit

module Engine
  class RepositoryCloner

    def initialize(user, repository, branch)
       @user = user
       @repository = repository
      #if the branch is nil then find the default branch

      if branch.blank?
        @branch = find_default_branch()
      else
        @branch = branch
      end

      @working_dir = '/tmp/'+@repository+'/'+@branch+'/'+Time.now.to_s

      @repo = Grit::Git.new(@working_dir)

      #clone repo with the url
      clone!()

      #send instance to analysis


    end

    def repo_size
      Dir.entries(@working_dir).size
    end

    def find_default_branch()
      response = HTTParty.get("https://api.github.com/repos/"+@user+"/"+@repository)
      response_hash = JSON.parse(response.body)
      response_hash['default_branch']
    end

    private

    def clone!()
      url = 'https://github.com/'+@user+'/'+@repository+'.git'
      @repo.clone({:branch => @branch}, url , @working_dir)

      #TODO Remove this when we have a nice report to show
      #raise "Success! It's cloned and everything!"
    end


  end
end