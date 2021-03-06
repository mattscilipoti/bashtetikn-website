require 'bashtetikn'

# Scans a URL, recording HTML validation issues
class HtmlValidationPageScan < PageScan
  def self.icon_name
    'w3c_validator_nu_icon'
  end

  def self.validator
    Bashtetikn::HtmlValidatorFromW3C.new
  end

  def self.validator_name
    'W3C Nu Validator'
  end

  def self.validator_uri
    validator.validator.validator_uri
  end

  def icon_name
    self.class.icon_name
  end

  def issues(filter: nil)
    return self[:issues] if filter.nil?

    case filter
    when :image_alt_attribute
      self[:issues].select {|issue| issue =~ /“img” element must have an “alt” attribute/ }
    else
      raise ArgumentError, "Unsupported filter (#{filter}) for issues."
    end
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
end
