class Run < ActiveRecord::Base
  attr_accessible :category, :time_in_seconds, :url, :verified
end
