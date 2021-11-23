class Website < ApplicationRecord
  has_many :webpages, dependent: :destroy
  validates :name, presence: true
  validates :url, presence: true, url: { public_suffix: true }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def html_validation_scan
    webpages.each(&:validate_html)
  end
end
