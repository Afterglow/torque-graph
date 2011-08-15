class TorqueController < ApplicationController
  def index

    if not params[:time] or not params[:id] or not params[:session]
      logger.debug("Wrong arguments to torque")
      render :text => "Wrong arguments!"
      return
    else
      logger.debug("Attempting to find device")
      device = Device.find_by_deviceid(params[:id])
      if not device
        render :text => "No such device"
        return
      end
      session = params[:session]
      time = params[:time].to_i/1000

      params.each do|pid,value|
        if pid.start_with?('k')
          reading = Reading.new()
          reading.did = device.deviceid
          reading.sid = session
          reading.t = time
          reading.s = pid
          reading.v = value
          if not reading.save()
            render :text => "Error saving #{pid}"
            return
          end
        end
      end
      render :text => "OK!"
    end
  end
end
