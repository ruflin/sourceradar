class PagesController < ApplicationController
  def home
  end

  def report

    if params[:pages].nil? ||  params[:pages][:link].blank?
      @message = "Please provide a URL"
      @branch = ""
      return
    end

    repository_svc = RepositoryService.new(params[:pages][:link], params[:pages][:branch])

    if repository_svc.is_valid_url?
      @message = "Analising repository"
    else
      @message = "The link you submitted is invalid"
      return
    end

    @branch = "default"

    if !repository_svc.branch_exists?
      @message = "The submitted branch doesn't exist"
      @branch = ""
    else
      @branch = params[:pages][:branch] unless params[:pages][:branch].blank?
    end

    @number_files = repository_svc.get_number_of_files()

  end


end