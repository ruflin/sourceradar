require_relative '../../lib/engine'

class RepositoryService
  def initialize(url, branch = "")
    @url = url
    @branch = branch.to_s
  end

 def is_valid_url?
   HTTParty.get(@url).code == 200

 rescue => e

 end

  def branch_exists?
    Rails.logger.debug("url:" + @url )
    Rails.logger.debug("branch:" + @branch )
    url = chopUrl(@url)
    HTTParty.get(url+"/branches/"+@branch).code == 200  #if the branch is "" it still gives 200

  end

  def chopUrl(url)
    url.chomp(".git")
  end


  def send_to_engine(url, branch)
    Engine::RepositoryCloner.new(url,branch)

  end
end