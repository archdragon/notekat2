class RenameNotesFolderColumnToNotebook < ActiveRecord::Migration
  def change
    rename_column :notes, :folder_id, :notebook_id
  end
end
