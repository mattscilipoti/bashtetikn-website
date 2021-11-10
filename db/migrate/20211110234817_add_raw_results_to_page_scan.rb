class AddRawResultsToPageScan < ActiveRecord::Migration[6.1]
  def change
    add_column :page_scans, :raw_results, :string
  end
end
