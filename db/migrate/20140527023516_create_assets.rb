class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.string :type
      t.string :author
      t.text :body
      t.references :collection
      t.attachment :assets, :cover

      t.timestamps
    end
  end
end
