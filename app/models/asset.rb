class Asset < ActiveRecord::Base
  has_attached_file :cover, :styles => { :medium => "290x160>" }
end
