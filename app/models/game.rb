class Game < ActiveRecord::Base
  attr_accessible :name, :publisher, :release_year, :series, :system
	has_many :runs, :dependent => :destroy
	has_many :moderates, :dependent => :destroy
	has_many :users, :through => :moderates
end
