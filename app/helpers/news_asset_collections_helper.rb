module NewsAssetCollectionsHelper
  def link_to_remove_field(name)
    link_to_function name, "NewsAsset.remove_fields(this)", class: "btn btn-default"
  end

  def link_to_add_field(name, f)
    new_obj = f.object.class.reflect_on_association(:news_assets).klass.new
    collection = "<div class=\"thumbnail fields\"><img alt=\"Default image\" data-target=\"#modalnew_collection\" data-toggle=\"modal\" src=\"/assets/default_image.gif\"><a class=\"btn btn-default\" href=\"#\" onclick=\"NewsAsset.remove_fields(this); return false;\">Remove</a></div>"
    field = f.simple_fields_for :news_assets, new_obj ,child_index: "new_field" do |sf|
      render "news_asset_field", f: sf, index: "new_field"
    end
    link_to_function name, "NewsAsset.add_fields(this, \"#{j(collection)}\", \"#{j(field)}\")", class: "btn btn-default"
  end
end

