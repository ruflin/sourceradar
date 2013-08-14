module Engine
  class RepositoryService


    @user = ""
    @repository = ""

    def initialize(url, branch = "")
      @url = url
      puts
      @branch = branch.to_s
      if !is_valid_url?
        raise "The link you submitted is invalid"
      end

      if !branch_exists?
        raise  "The submitted branch doesn't exist"
      end

      get_user_and_repo(url)
      send_to_engine(@user,@repository,branch)

      #return 'Analysis for repository '+@repository+ ' in the '+ @branch +'branch.'
    end

    def is_valid_url?
      HTTParty.get(@url).code == 200

    rescue => e

    end

    def branch_exists?
      Rails.logger.debug("url:" + @url )
      Rails.logger.debug("branch:" + @branch )
      url_chopped = chop_url(@url)
      HTTParty.get(url_chopped+"/branches/"+@branch).code == 200  #if the branch is "" it still gives 200
    end

    def chop_url(url)

      url.chomp(".git")

    end

     # [https:][][github.com][balgan][scan-tools]
    def get_user_and_repo(url)

      user_position_in_url = 3
      repository_position_in_url = 4

      url_chopped = chop_url(url)
      url_splitted = url_chopped.split('/')


      @user = url_splitted[user_position_in_url]
      @repository = url_splitted[repository_position_in_url]

    end


    def send_to_engine(user, repository, branch)
      Engine::RepositoryCloner.new(user, repository,branch)
    end


    #def get_number_of_files()
    #  send_to_engine(@url, @branch).repo_size()

   # end


  end
end