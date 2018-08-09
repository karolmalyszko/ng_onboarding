class SimpleWorker

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform()
    puts "Sidekiq worker fired up."
  end

end
