require 'bashtetikn'

# Scans a URL, recording HTML validation issues
class HtmlValidationScan < PageScan
  def scan
    results = validator.validate_uri(self.url)

    update!(
      raw_results: results.to_json,
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
