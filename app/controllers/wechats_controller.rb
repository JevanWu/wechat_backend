class WechatsController < ApplicationController
  wechat_responder
  before_action :build_keywords_replies, only: [:create]

  on :text do |request, content|
    default_reply = DefaultReply.first
    request.reply.text default_reply.content unless default_reply.nil?
  end
  
  on :event, with: "subscribe" do |request|
    subscribe_reply = SubscribeReply.first
    request.reply.text subscribe_reply.content unless subscribe_reply.nil?
  end

  private

  def build_keywords_replies 
    #key words replies
    KeywordReply.all.each do |keyword_reply|
      keyword_reply.keywords.each do |keyword|
        self.class.on :text, with: keyword.keyword do |request|
          request.reply.text keyword_reply.content if keyword_reply.asset_id.nil?
          if keyword_reply.asset.is_a?NewsAssetCollection
            news_collection = keyword_reply.asset.news_assets
            assets_count = news_collection.count
            articles_range = (0... [assets_count, 10].min)
            request.reply.news(articles_range) do |article, i| 
              article.item title: news_collection[i].title, description: news_collection[i].description, pic_url: ENV["DOMAIN"] + news_collection[i].cover.url, url: news_collection[i].url
            end
          elsif keyword_reply.asset.is_a?ImageAsset 
            if keyword_reply.asset.updated_at.to_date <= 3.days.from_now
              WechatUploader.upload_image(keyword_reply.asset)
            end
            request.reply.image keyword_reply.asset.media_id
          end
        end
      end
    end
  end
end
