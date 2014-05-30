class ImageTextCollection < ActiveRecord::Base
  has_many :image_texts, dependent: :destroy
  accepts_nested_attributes_for :image_texts, reject_if: lambda{ |x| x[:title].blank? }, allow_destroy: true
end
