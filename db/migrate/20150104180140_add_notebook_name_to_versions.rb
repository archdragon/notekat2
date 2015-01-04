class AddNotebookNameToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :notebook_name, :string
  end
end
