class PageScan < ApplicationRecord
  # self.abstract_class = true

  belongs_to :webpage, optional: true
  validates :url, presence: true, url: { public_suffix: true }

  def scan
    result = validator.validate_uri(self.url)
    update!(
      warnings: result.warnings.collect(&:message),
      issues: result.errors.collect(&:message),
    )
  end

  def validator
    raise NotImplementedError, "Implement in child"
  end
end
