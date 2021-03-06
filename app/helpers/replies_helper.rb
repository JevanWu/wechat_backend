module RepliesHelper
  def input_generator(type, builder)
    case type
    when "text"
      builder.input :content
    when "asset"
      builder.input :asset_id, as: :select, collection: Asset.ids
    # when "news"
    #   builder.input :asset_id, as: :select, collection: NewsAsset.ids
    end
  end
end
