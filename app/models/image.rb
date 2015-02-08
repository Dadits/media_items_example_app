class Image < ActiveRecord::Base

  belongs_to :media_item

  has_attached_file :file, 
              styles: { medium: "300x300>", thumb: "100x100>" }, 
         default_url: "/images/missing.png"

  validates_attachment :file, presence: true
  validates_attachment :file,
           content_type: { content_type: /\Aimage\/.*\Z/ },
                   size: { less_than: 2.megabytes }

end
