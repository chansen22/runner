class Follow < ActiveRecord::Base
  belongs_to :user
  attr_accessible :followee_id
end
