class Follow < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  attr_accessible :followee_id
end
