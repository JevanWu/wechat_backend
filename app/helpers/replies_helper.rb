module RepliesHelper
  def input_generator(type, builder)
    case type
    when "text"
      builder.input :content, input_html: { class: "summernote" }
    when "asset"
      builder.input :asset_id, as: :select, collection: NewsAssetCollection.ids.concat(ImageAsset.ids).sort
    # when "news"
    #   builder.input :asset_id, as: :select, collection: NewsAsset.ids
    end
  end
end
