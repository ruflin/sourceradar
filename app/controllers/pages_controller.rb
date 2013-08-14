require 'engine'

class PagesController < ApplicationController

  include Engine



  def home
  end

  def report

    if params[:pages].nil? ||  params[:pages][:link].blank?
      @message = "Please provide a URL"

      return
    end

    begin
      Engine::RepositoryService.new(params[:pages][:link], params[:pages][:branch])
    rescue => e
       @message = e.message
    end

  end


end