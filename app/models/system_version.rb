class SystemVersion < ActiveRecord::Base
  attr_accessible :major, :minor
  def self.latest
    order(:created_at).last
  end

  def name
    "Pilot v#{version_name}"
  end

  def version_name
    "#{major}.#{minor}"
  end
end
