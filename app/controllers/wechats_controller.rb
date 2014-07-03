class WechatsController < ApplicationController
  wechat_responder

  #key words replies
  def create
    @keyword = Keyword.find_by(keyword: params[:xml][:Content]) if params[:xml][:MsgType] == "text"
    super
  end

  if !@keyword.nil?
    ordinary_reply = @keyword.ordinary_reply
    request.reply.text ordinary_reply.content if ordinary_reply.asset_id.nil?
    if ordinary_reply.asset.is_a?NewsAssetCollection
      news_collection = ordinary_reply.asset.news_assets
      assets_count = news_collection.count
      articles_range = (0... [assets_count, 10].min)
      request.reply.news(articles_range) do |article, i| 
        article.item title: news_collection[i].title, description: news_collection[i].description, pic_url: ENV["DOMAIN_NAME"] + news_collection[i].cover.url, url: news_collection[i].url
      end
      
    elsif ordinary_reply.asset.is_a?ImageAsset 
      request.reply.image ordinary_reply.asset.media_id
    end
  end

  on :text do |request, content|
    default_reply = DefaultReply.first
    request.reply.text default_reply.content unless default_reply.nil?
  end
  
  on :event, with: "subscribe" do |request|
    subscribe_reply = SubscribeReply.first
    request.reply.text subscribe_reply.content unless subscribe_reply.nil?
  end
end
