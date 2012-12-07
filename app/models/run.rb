class Run < ActiveRecord::Base
  attr_accessible :category, :time_in_seconds, :url, :verified
  belongs_to :game
  belongs_to :user
  has_many :comments, :dependent => :destroy

  def self.set_correct_time(time)
    times = time.split(":")
    logger.info("\n\n\n\n\n\nTIME IS #{time} and times is #{times}")
  end
end
