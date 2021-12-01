# Data Migration for renamed class
# Renamed HtmlValidationScan to HtmlValidationPageScan
class DataRenameHtmlValidationScan < ActiveRecord::Migration[6.1]
  def up
    say_with_time "Updating all PageScans with type=='HtmlValidationScan' to 'HtmlValidation*Page*Scan'" do
      PageScan.where(type: 'HtmlValidationScan').update_all(type: 'HtmlValidationPageScan')
    end
  end

  def down 
    say_with_time "Reverting all HtmlValidationPageScan to HtmlValidationScan" do
      PageScan.where(type: 'HtmlValidationPageScan').update_all(type: 'HtmlValidationScan')
    end
  end
end
