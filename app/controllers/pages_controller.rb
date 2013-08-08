class PagesController < ApplicationController
  def home
  end

  def report
    if params[:pages][:link].blank?
      @message = "Please provide a URL"
      return
    end

    if is_valid_url?(params[:pages][:link])
      @message = "Analising repository " +params[:pages][:link]
    else
      @message = "The link you submitted is invalid"
    end



    if params[:pages][:branch].blank?
      @branch = "Using default branch"
    else
      if branch_exists?(params[:pages][:link],params[:pages][:branch])
        @branch = "Using "+params[:pages][:branch]+" branch"
      else
        @branch = "The submitted branch doesn't exist"
      end
    end
  end


  def is_valid_url?(url)
    HTTParty.get(url).code == 200
  end

  def branch_exists?(url,branch)
    HTTParty.get(url+"/branches/"+branch).code == 200
  end
end
