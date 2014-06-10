class CreateNewsAssetCollections < ActiveRecord::Migration
  def change
    create_table :news_asset_collections do |t|

      t.timestamps
    end
  end
end
