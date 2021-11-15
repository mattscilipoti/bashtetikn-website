class PageScanJob < ApplicationJob
  queue_as :default

  before_enqueue do |job|
    scanner_id = job.arguments.first
    logger.debug("Enqueuing PageScan: #{scanner_id}")
    scanner = PageScan.find(scanner_id)
    scanner.update(queued_at: Time.now.utc)
  end

  def perform(scanner_id)
    logger.debug("Performing PageScan: #{scanner_id}")
    scanner = PageScan.find(scanner_id)
    scanner.scan
  end
end
