class MediaItem < ActiveRecord::Base
  MEDIA_TYPES = %w(image video website)

  belongs_to :user, dependent: :destroy
  has_many :images, dependent: :destroy
  has_one :link, dependent: :destroy
    
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :link, allow_destroy: true, reject_if: :all_blank  
  
  validates_presence_of :name
  validates_inclusion_of :shared, in: [true, false]
  validates_inclusion_of :media_type, in: MediaItem::MEDIA_TYPES
  validates_presence_of :link, if: :is_media_link?
  validates_presence_of :images, if: :is_media_image?
  
  private
    
    def is_media_image?
      media_type == "image"
    end

    def is_media_link?
      !is_media_image?
    end  
  
end
