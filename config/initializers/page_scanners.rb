# Load PageScan models to populate PageScan.descendants
Rails.logger.debug "Initializing PageScan.descendants"

Rails.application.reloader.to_prepare do
  page_scans_path = Rails.root.join('app/models/*_scan.rb')
  require_dependency Rails.root.join('app/models/application_record') # required by PageScan
  require_dependency Rails.root.join('app/models/page_scan') # required by children
  missing_dirs = Dir[page_scans_path].reject {|dir| Rails.configuration.eager_load_paths.include?(dir) }
  Rails.configuration.eager_load_paths += missing_dirs
  missing_dirs.each {|file| require_dependency file}
  Rails.logger.debug "PageScan.descendants==#{PageScan.descendants.collect(&:name)}"
end
