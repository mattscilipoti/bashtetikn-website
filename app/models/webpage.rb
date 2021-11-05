require 'bashtetikn'

class Webpage < ApplicationRecord
  validates :url, presence: true, url: { public_suffix: true }

  def validate_html
    validator = Bashtetikn::HtmlValidatorFromW3C.new
    validator.validate_uri(self.url)
  end
end
