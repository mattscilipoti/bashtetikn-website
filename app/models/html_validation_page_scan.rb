require 'bashtetikn'

# Scans a URL, recording HTML validation issues
class HtmlValidationPageScan < PageScan
  def self.icon_name
    'microscope'
  end

  def self.validator
    Bashtetikn::HtmlValidatorFromW3C.new
  end

  def self.validator_uri
    validator.validator.validator_uri
  end

  def icon_name
    self.class.icon_name
  end

  def scan
    results = validator.validate_uri(self.url)

    update!(
      raw_results: results.to_json,
      scanned_at: Time.now.utc,
      warnings: results.warnings.collect(&:message),
      issues: results.errors.collect(&:message),
    )
  end

  def scan_results_uri
    URI::HTTPS.build(
      host: 'validator.w3.org',
      path: '/nu/',
      query: { doc: url }.to_query,
    )
  end

  def validator
    self.class.validator
  end

  def validator_uri
    self.class.validator_uri
  end
end
