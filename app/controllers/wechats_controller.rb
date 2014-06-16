class WechatsController < ApplicationController
  wechat_responder

  on :event, with: "subscribe" do |request|
    reply = SubscribeReply.first
    request.reply.text reply.content unless reply.nil?
  end

  on :text do |request, content|
    reply = DefaultReply.first
    request.reply.text message.content unless message.nil?
  end

  #key words replies
  OrdinaryReply.all.each do |reply|
    reply.keywords.each do |keyword|
      on :text, with: keyword.keyword do |request|

        request.reply.text reply.content if reply.asset_id.nil?

        if reply.asset.is_a?NewsAsset
          request.reply.text reply.content 
        elsif reply.asset.is_a?NewsAssetCollection
          request.reply.text reply.content 
          # assets_count = reply.asset.news_asset.count
          # articles_range = (0... [assets_count, 10].min)
          # request.reply.news(articles_range) do |article, i| 
          #   article.item title: "#{reply.title}", description:"内容描述#{i}", pic_url: "http://www.baidu.com/img/bdlogo.gif", url:"http://www.baidu.com/"
          # end
          
        elsif reply.asset.is_a?ImageAsset 
          request.reply.text reply.content
        end
      end
    end
  end
end
