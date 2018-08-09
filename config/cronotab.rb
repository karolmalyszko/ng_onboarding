# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
class TestJob
  def perform
    puts "I'm a grown-up crono job and i can take care of my own! Be gone, Satan!"
    SimpleWorker.perform_async()
#    render html: "Worker should be fired right about now"
  end
end
#
Crono.perform(TestJob).every 10.seconds #, at: '15:30'
#
