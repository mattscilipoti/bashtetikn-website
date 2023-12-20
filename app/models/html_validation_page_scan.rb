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
    when :hidden_autocomplete
      # An “input” element with a “type” attribute whose value is “hidden” must not have an “autocomplete” attribute whose value is “on” or “off”.
      self[:issues].select {|issue| issue =~ /“input” element with.+hidden.+must not have.+autocomplete/ }
    when :image_alt_attribute
      # 'An “img” element must have an “alt” attribute, except under certain conditions. For details, consult guidance on providing text alternatives for images.',
      self[:issues].select {|issue| issue =~ /“img” element must have an “alt” attribute/ }
    else
      raise ArgumentError, "Unsupported filter (#{filter}) for issues."
    end
  end

  def issues_missing_img_alt
    issues(filter: :image_alt_attribute)
  end

  def issues_missing_img_alt_percentage
    percentage_of_all_issues(issues_missing_img_alt)
  end

  def issues_with_hidden_input_and_autocomplete
    issues(filter: :hidden_autocomplete)
  end

  def issues_with_hidden_input_and_autocomplete_percentage
    percentage_of_all_issues(issues_with_hidden_input_and_autocomplete)
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

  private

  def percentage_of_all_issues(item_count)
    return 0 unless issues.size > 0 # handle divide by zero

    # Use to_f to handle very small percentages (497/498==0, 497/498.0==0.99799)
    (item_count.size/issues.size.to_f)*100
  end
end
