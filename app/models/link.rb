class Link < ActiveRecord::Base
  validates_presence_of :nazwa, :hyperlink, :message => " nie może być puste!"
  
  def self.find_ordered
    find(:all, :order => "`order`")
  end
  
  def before_save
    if self.order.nil?
      t = Link.find(:first, :select => " MAX(`order`) AS `MAX`")
      self.order = t.MAX.to_i + 1
    end
  end
end
