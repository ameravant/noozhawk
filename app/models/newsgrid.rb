class Newsgrid < ActiveRecord::Base
  unloadable
  validates_presence_of :time_frame
  has_many :menus, :as => :navigatable, :dependent => :destroy
  has_many :features, :as => :featurable, :dependent => :destroy
  has_permalink :title
  def to_param
    "#{self.id}-#{self.permalink}"
  end
  def stories
    Article.find(:all, :conditions => ["published_at <= ? and published_at >= ? and published = ?", Time.now, (self.time_frame).hours.ago, true])
  end
end