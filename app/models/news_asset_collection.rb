class NewsAssetCollection < Asset 
  has_many :news_assets, dependent: :destroy
  accepts_nested_attributes_for :news_assets, reject_if: lambda{ |x| x[:title].blank? }, allow_destroy: true
end
