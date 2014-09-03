class WechatsController < ApplicationController
  wechat_responder
  before_action :build_keyword_replies, only: [:create]

  on :text do |request, content|
    default_reply = DefaultReply.first
    request.reply.text default_reply.content unless default_reply.nil?
  end
  
  on :event, with: "subscribe" do |request|
    subscribe_reply = SubscribeReply.first
    request.reply.text subscribe_reply.content unless subscribe_reply.nil?
  end

  on :event, with: "click" do |request|
    MenuReply.all.each do |menu_reply|
      if menu_reply.keywords.first.keyword == request.event_key
        responce_of menu_reply
      end
    end
  end

  private

  def build_keyword_replies 
    #key words replies
    KeywordReply.all.each do |keyword_reply|
      keyword_reply.keywords.each do |keyword|
        self.class.on :text, with: keyword.keyword do |request|
          responce_of keyword_reply
        end
      end
    end
  end

  def responce_of(reply)
    request.reply.text reply.content if reply.asset_id.nil?
    if reply.asset.is_a?NewsAssetCollection
      news_collection = reply.asset.news_assets
      assets_count = news_collection.count
      articles_range = (0... [assets_count, 10].min)
      request.reply.news(articles_range) do |article, i| 
        article.item title: news_collection[i].title, description: news_collection[i].description, pic_url: ENV["DOMAIN_NAME"] + news_collection[i].cover.url, url: news_collection[i].url
      end
    elsif reply.asset.is_a?ImageAsset 
      if reply.asset.updated_at.to_date <= 3.days.from_now
        WechatUploader.upload_image(reply.asset)
      end
      request.reply.image reply.asset.media_id
    end
  end
end
