class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "Hello NetLanders, it's me again :D"
  end

  def goodbye
    render html: "Be gone, satan!!!"
  end

  def fire_worker
    SimpleWorker.perform_async()
    render html: "Worker should be fired right about now"
  end
end
