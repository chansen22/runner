class Comment < ActiveRecord::Base
  attr_accessible :text
	belongs_to :game
end
