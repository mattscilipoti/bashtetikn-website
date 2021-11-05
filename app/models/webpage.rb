require 'bashtetikn'

class Webpage < ApplicationRecord
  has_many :validations
  validates :url, presence: true, url: { public_suffix: true }

  def html_validator
    Bashtetikn::HtmlValidatorFromW3C.new
  end

  def validate_html
    result = html_validator.validate_uri(self.url)
    validations.build(
      url: url,
      warnings: result.warnings.collect(&:message),
      issues: result.errors.collect(&:message),
    )
  end
end
