module RepliesHelper
  def input_generator(type, builder)
    case type
    when "text"
      builder.input :content, input_html: { class: "summernote" }
    when "image"
      builder.input :asset_id, as: :select, collection: ImageAsset.ids
    when "news"
      builder.input :asset_id, as: :select, collection: NewsAsset.ids
    end
  end
end
