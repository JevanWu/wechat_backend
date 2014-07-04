class CreateNewsAssets < ActiveRecord::Migration
  def change
    create_table :news_assets do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :url
      t.references :news_asset_collection
      t.attachment :news_assets, :cover

      t.timestamps
    end
  end
end
