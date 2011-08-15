class SessionsController < ApplicationController

  def deviceindex
  end

  def sessionindex
  end

  def sensor    
    @readings = Reading.all(:sid => params[:session], :did => params[:device], :s => params[:sensor], :order => 't')
    logger.debug("Length is: "+@readings.length.to_s())
    if not @readings
      render(:text => "No readings")
      return
    end

    @data = []
    for r in @readings
      @data.push(r.v)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @readings }
    end
  end
end
