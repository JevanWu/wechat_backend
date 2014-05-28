class CreateImageTextCollections < ActiveRecord::Migration
  def change
    create_table :image_text_collections do |t|

      t.timestamps
    end
  end
end
