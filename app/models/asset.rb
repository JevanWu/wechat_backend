class Asset < ActiveRecord::Base
  has_attached_file :cover, :styles => { :thumb => "200x200#" }
end
