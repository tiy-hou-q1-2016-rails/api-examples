class Photo < ActiveRecord::Base
  validates :title, :url, :thumbnailUrl, presence: true
end
