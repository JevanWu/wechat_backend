class WechatsController < ApplicationController
  wechat_responder

  #key words replies
  OrdinaryReply.all.each do |keyword_reply|
    keyword_reply.keywords.each do |keyword|
      on :text, with: keyword.keyword do |request|

        request.reply.text keyword_reply.content if keyword_reply.asset_id.nil?

        if keyword_reply.asset.is_a?NewsAssetCollection
          logger.info "news asset collection"
          collection = keyword_reply.asset.news_assets
          assets_count = collection.count
          articles_range = (0... [assets_count, 10].min)
          request.reply.news(articles_range) do |article, i| 
            article.item title: collection[i].title, description: collection[i].description, pic_url: "http://wechat.hua.li" + collection[i].cover.url, url: collection[i].url
          end
          
        elsif keyword_reply.asset.is_a?ImageAsset 
          logger.info "media_id:" + keyword_reply.asset.media_id.inspect
          request.reply.image keyword_reply.asset.media_id
        end
      end
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
