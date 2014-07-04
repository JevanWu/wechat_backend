class NewsAsset < ActiveRecord::Base 
  has_attached_file :cover, :styles => { :medium => "200x200#" }
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
