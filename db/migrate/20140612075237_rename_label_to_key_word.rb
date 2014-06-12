class RenameLabelToKeyWord < ActiveRecord::Migration
  def change
    rename_column :messages, :label, :keyword
  end
end
