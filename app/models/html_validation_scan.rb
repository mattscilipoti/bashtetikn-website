require 'bashtetikn'

# Scans a URL, recording HTML validation issues
class HtmlValidationScan < PageScan
  def validator
    Bashtetikn::HtmlValidatorFromW3C.new
  end
end
