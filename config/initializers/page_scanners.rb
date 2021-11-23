# Load PageScan models to populate PageScan.descendants
Rails.logger.debug "Initializing PageScan.descendants"

Rails.application.reloader.to_prepare do
  require_dependency Rails.root.join('app/models/application_record.rb') # required by PageScan
  require_dependency Rails.root.join('app/models/page_scan.rb') # required by children

  page_scans_path = Rails.root.join('app/models/*_scan.rb')
  missing_files = Dir[page_scans_path].reject {|dir| Rails.configuration.eager_load_paths.include?(dir) }
  Rails.logger.debug "Initializing PageScan.descendants, missing_files: #{missing_files}"
  Rails.configuration.eager_load_paths += missing_files
  # require the missing files
  missing_files.each {|file| require_dependency file}
  Rails.logger.debug "PageScan.descendants==#{PageScan.descendants.collect(&:name)}"
end
