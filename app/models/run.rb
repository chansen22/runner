class Run < ActiveRecord::Base
  attr_accessible :category, :time_in_seconds, :url, :verified
  belongs_to :game
  belongs_to :user
  has_many :comments, :dependent => :destroy
end
