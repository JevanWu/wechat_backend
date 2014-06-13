class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :type
      t.text :content
      t.references :asset

      t.timestamps
    end
  end
end
