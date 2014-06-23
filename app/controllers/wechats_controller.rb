class WechatsController < ApplicationController
  wechat_responder

  on :event, with: "subscribe" do |request|
    reply = SubscribeReply.first
    request.reply.text reply.content unless reply.nil?
  end

  on :text do |request, content|
    reply = DefaultReply.first
    request.reply.text reply.content unless reply.nil?
  end

  #key words replies
  OrdinaryReply.all.each do |reply|
    reply.keywords.each do |keyword|
      on :text, with: keyword.keyword do |request|

        request.reply.text reply.content if reply.asset_id.nil?

        if reply.asset.is_a?NewsAssetCollection
          logger.info "news asset collection"
          collection = reply.asset.news_assets
          assets_count = collection.count
          articles_range = (0... [assets_count, 10].min)
          request.reply.news(articles_range) do |article, i| 
            article.item title: collection[i].title, description: collection[i].description, pic_url: "http://wechat.hua.li" + collection[i].cover.url, url: collection[i].url
          end
          
        elsif reply.asset.is_a?ImageAsset 
          logger.info "media_id:" + reply.asset.media_id.inspect
          request.reply.image reply.asset.media_id
        end
      end
    end
  end
end
