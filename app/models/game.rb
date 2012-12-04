class Game < ActiveRecord::Base
  attr_accessible :name, :publisher, :release_year, :series, :system
end
