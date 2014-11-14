class RenameFoldersToNotebooks < ActiveRecord::Migration
  def change
    remove_index :folders, :ancestry
    rename_table :folders, :notebooks
    add_index :notebooks, :ancestry
  end
end