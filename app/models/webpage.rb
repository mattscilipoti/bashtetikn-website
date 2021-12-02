# Represents a page to be scanned
class Webpage < ApplicationRecord
  belongs_to :website, optional: true, inverse_of: :webpages
  has_many :page_scans
  validates :url, presence: true, url: { public_suffix: true }

  def html_validation_scanner
    HtmlValidationPageScan.new(url: self.url)
  end

  def last_scans
    one_of_each_type = []
    page_scans.scanned.order(scanned_at: :desc).each do |scan|
      next if one_of_each_type.pluck(:type).include?(scan.type)

      one_of_each_type << scan
    end
    one_of_each_type
  end

  def html_validation_page_scan
    scanner = html_validation_scanner
    scanner.save!
    page_scans << scanner
    PageScanJob.perform_later scanner.id
  end
end
