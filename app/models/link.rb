class Link < ActiveRecord::Base
  
  belongs_to :media_item
  
  validates_presence_of :link_type
  validates_format_of :url, with: URI::regexp(%w(http https))
  
end
