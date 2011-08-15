class SessionsController < ApplicationController
  def index
  end

  def sensor
    @device = .find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @device }    
  end

end
