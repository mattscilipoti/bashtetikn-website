class Website < ApplicationRecord
  has_many :webpages, dependent: :destroy
  validates :name, presence: true
  validates :url, presence: true, url: { public_suffix: true }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  # Perform a HTML Validation scan for all of the site's webpages
  def html_validation_page_scan
    webpages.each(&:html_validation_page_scan)
  end
end
