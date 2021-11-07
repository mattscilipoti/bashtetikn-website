# Represents a page to be scanned
class Webpage < ApplicationRecord
  has_many :page_scans
  validates :url, presence: true, url: { public_suffix: true }

  def html_validation_scanner
    HtmlValidationScan.new(url: self.url)
  end

  def validate_html
    scanner = html_validation_scanner
    scanner.scan
    page_scans << scanner
  end
end
