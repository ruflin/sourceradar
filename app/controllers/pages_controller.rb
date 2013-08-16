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
      engine_service = Engine::RepositoryService.new(params[:pages][:link], params[:pages][:branch])
      if engine_service.is_ok?
        engine_service.send_to_engine
      end

    rescue => e
       @message = e.message
    end

  end


end