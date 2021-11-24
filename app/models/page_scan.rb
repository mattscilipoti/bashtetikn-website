# Acts as an Interface and Base Class for PageScan descendants
class PageScan < ApplicationRecord
  # self.abstract_class = true

  belongs_to :webpage, optional: true
  validates :url, presence: true, url: { public_suffix: true }

  scope :queued, -> { where.not(queued_at: nil).where(scanned_at: nil) }
  scope :scanned, -> { where.not(scanned_at: nil) }

  def icon_name
    raise NotImplementedError, "Implement in child"
  end

  def scan
    raise NotImplementedError, "Implement in child"
  end

  def scan_results_uri
    raise NotImplementedError, "Implement in child"
  end

  def state
    :scanned if scanned_at?
    :queued if queued_at?
    :initialized
  end

  def validator
    raise NotImplementedError, "Implement in child"
  end

  def validator_uri
    raise NotImplementedError, "Implement in child"
  end
end
