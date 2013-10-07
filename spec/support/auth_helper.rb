  def login(us)
    request.env['warden'].stub :authenticate! => us
       controller.stub :current_user => us
  end