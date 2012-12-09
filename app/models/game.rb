class Game < ActiveRecord::Base
  attr_accessible :name, :publisher, :release_year, :series, :system, :coverart
  has_attached_file :coverart, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :runs, :dependent => :destroy
  has_many :moderates, :dependent => :destroy
  has_many :users, :through => :moderates

  validates(:name, presence: true)
  validates(:publisher, presence: true)
  validates(:release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year } )
  validates(:system, presence: true)
end
