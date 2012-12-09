class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :run
  belongs_to :user
end
