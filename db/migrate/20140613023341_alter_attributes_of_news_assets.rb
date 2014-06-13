class AlterAttributesOfNewsAssets < ActiveRecord::Migration
  def change
    rename_column :assets, :body, :description
    add_column :assets, :url, :string
  end
end
