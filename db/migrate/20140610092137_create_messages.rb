class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :type
      t.string :label
      t.text :content
      t.integer :media_id
      t.string :title
      t.text :description
      t.string :music_url
      t.string :hq_music_url
      t.string :thumb_media_id
      t.integer :article_count
      t.string :picurl
      t.string :url

      t.timestamps
    end
  end
end
