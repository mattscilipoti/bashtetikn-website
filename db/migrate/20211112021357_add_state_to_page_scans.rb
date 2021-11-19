class AddStateToPageScans < ActiveRecord::Migration[6.1]
  def change
    add_column :page_scans, :queued_at, :datetime
    add_column :page_scans, :scanned_at, :datetime

    add_index :page_scans, :queued_at
    add_index :page_scans, :scanned_at
  end
end
