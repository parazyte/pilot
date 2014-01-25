require 'yaml'

Resque.redis = YAML.load(ERB.new(File.read(Rails.root.to_s + '/config/resque.yml')).result)[Rails.env.to_s]
Resque.schedule = YAML.load_file(File.join(Rails.root.to_s + '/config/resque_schedule.yml')) # load the schedule
Resque.logger.level = Logger::INFO
Resque.logger.formatter = Resque::VeryVerboseFormatter.new
