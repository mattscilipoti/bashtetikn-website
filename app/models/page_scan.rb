# Acts as an Interface and Base Class for PageScan descendants
require "sti_preload" # preloads descendants
class PageScan < ApplicationRecord
  include StiPreload # Only in the root STI class.

  belongs_to :webpage, optional: true
  validates :url, presence: true, url: { public_suffix: true }

  scope :queued, -> { where.not(queued_at: nil).where(scanned_at: nil) }
  scope :scanned, -> { where.not(scanned_at: nil) }

  # The class used to validate the page
  def self.validator
    raise NotImplementedError, "Implement in child"
  end

  # The displyed name of the scan provider
  def self.validator_name
    raise NotImplementedError, "Implement in child"
  end

  # The URI of the scan provider
  def self.validator_uri
    raise NotImplementedError, "Implement in child"
  end
  

  def icon_name
    raise NotImplementedError, "Implement in child"
  end

  # Performs the page scan
  def scan
    raise NotImplementedError, "Implement in child"
  end

  # URI for the scan provider's results
  def scan_results_uri
    raise NotImplementedError, "Implement in child"
  end

  # State of the scan
  def state
    :scanned if scanned_at?
    :queued if queued_at?
    :initialized
  end

  def validator
    self.class.validator
  end

  def validator_name
    self.class.validator_name
  end

  def validator_uri
    self.class.validator_uri
  end
end
