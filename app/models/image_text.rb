class ImageText < Asset
  has_attached_file :cover, :styles => { :medium => "290x160>" }
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
