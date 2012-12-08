class Run < ActiveRecord::Base
  attr_accessible :category, :time_in_seconds, :url
  belongs_to :game
  belongs_to :user
  has_many :comments, :dependent => :destroy

  default_scope order("time_in_seconds ASC")
  
  validates(:time_in_seconds, presence: true, format: { with: /[0-9]{2}:[0-5][0-9]:[0-5][0-9]/ })
  validates(:category, presence: true)
  validates(:url, presence: true)

  before_save do |run|
    if run.url !~ /^(http:\/\/|https:\/\/).*\.com/
      run.url = "http://#{run.url}"
    end
  end

  def self.togglerun(runid)
    run = Run.find(runid)
    run.toggle!(:verified)
  end
end
