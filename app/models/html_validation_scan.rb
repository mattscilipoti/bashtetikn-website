require 'bashtetikn'

# Scans a URL, recording HTML validation issues
class HtmlValidationScan < PageScan
  def scan_results_uri
    URI::HTTPS.build(
      host: 'validator.w3.org', 
      path: '/nu',
      query: { doc: url }.to_query,
    )
  end

  def validator
    Bashtetikn::HtmlValidatorFromW3C.new
  end
end
