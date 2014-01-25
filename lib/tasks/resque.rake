require 'resque/tasks'
require 'resque_scheduler/tasks'

task "resque:setup" => :environment do
  $stdout.sync = true

  Resque.after_fork do |job|
    ActiveRecord::Base.establish_connection
  end
end