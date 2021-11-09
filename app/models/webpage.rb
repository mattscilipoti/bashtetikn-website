# Represents a page to be scanned
class Webpage < ApplicationRecord
  belongs_to :website, optional: true, inverse_of: :webpages
  has_many :page_scans, -> { order(created_at: :desc) }
  validates :url, presence: true, url: { public_suffix: true }

  def html_validation_scanner
    HtmlValidationScan.new(url: self.url)
  end

  def last_scans
    one_of_each_type = []
    page_scans.order(updated_at: :desc).each do |scan|
      one_of_each_type << scan unless one_of_each_type.pluck(:type).include?(scan.type)
    end
    one_of_each_type
  end

  def validate_html
    scanner = html_validation_scanner
    scanner.scan
    page_scans << scanner
  end
end
