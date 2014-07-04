class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.string :title
      t.text :description
      t.string :media_id
      t.attachment :assets, :image

      t.timestamps
    end
  end
end
