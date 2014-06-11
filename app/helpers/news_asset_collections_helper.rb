module NewsAssetCollectionsHelper
  def link_to_remove_field(name, index)
    link_to_function name, "remove_fields(this, \"#myModal#{index}\")", class: "btn btn-default"
  end

  def link_to_add_field(name, f)
    new_obj = f.object.class.reflect_on_association(:news_assets).klass.new
    trigger = "<div class=\"thumbnail fields\"><img alt=\"Default image\" data-target=\"#myModalnew_trigger\" data-toggle=\"modal\" src=\"/assets/default_image.gif\"><a class=\"btn btn-default\" href=\"#\" onclick=\"remove_fields(this, &quot;#myModal0&quot;); return false;\">Remove</a></div>"
    field = f.simple_fields_for :news_assets, new_obj do |sf|
      render "news_asset_field", f: sf, index: "new_field"
    end
    link_to_function name, "add_fields(this, \"#{j(trigger)}\", \"#{j(field)}\")", class: "btn btn-default"
  end
end

