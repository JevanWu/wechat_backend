class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.string :title
      t.string :author
      t.text :description
      t.string :picurl
      t.string :url
      t.string :media_id
      t.references :news_asset_collection
      t.attachment :assets, :cover
      t.attachment :assets, :image

      t.timestamps
    end
  end
end
