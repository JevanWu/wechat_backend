class WechatUploader

  def self.upload_image(image_asset)
    complete_path = "public" + image_asset.image.url.gsub(/\?[\w]+/, "")
    wechat_appid = ENV["WECHAT_APPID"]
    wechat_app_secret = ENV["WECHAT_APP_SECRET"]
    wechat_token_file = ENV["WECHAT_ACCESS_TOKEN"]
    if wechat_appid && wechat_app_secret && wechat_token_file
      puts "appid:" + wechat_appid
      wechat_api = Wechat::Api.new(wechat_appid, wechat_app_secret, wechat_token_file)
      file = File.new(complete_path)
      return_params = wechat_api.media_create("image", file)
      image_asset.update_column("media_id", return_params["media_id"])
    end
  end

end
