class RenameValidationsToPageScans < ActiveRecord::Migration[6.1]
  def change
    rename_table :validations, :page_scans
  end
end
