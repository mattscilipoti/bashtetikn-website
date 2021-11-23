require 'bashtetikn'

# Scans a URL, recording HTML validation issues
class HtmlValidationScan < PageScan
  def self.icon_name
    'microscope'
  end

  def icon_name
    self.call.icon_name
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
    Bashtetikn::HtmlValidatorFromW3C.new
  end
end
