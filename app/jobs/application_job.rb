class ApplicationJob < ActiveJob::Base
  def perform
    SimpleWorker.perform_async()
    render html: "Worker should be fired right about now"
  end
end
