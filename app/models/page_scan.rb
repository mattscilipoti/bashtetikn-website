class PageScan < ApplicationRecord
  # self.abstract_class = true

  belongs_to :webpage, optional: true
  validates :url, presence: true, url: { public_suffix: true }

  def scan
    raise NotImplementedError, "Implement in child"
  end

  def scan_results_uri
    raise NotImplementedError, "Implement in child"
  end

  def validator
    raise NotImplementedError, "Implement in child"
  end
end
