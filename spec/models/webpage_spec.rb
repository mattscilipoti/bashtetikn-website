require 'rails_helper'
require 'vcr_helper'

RSpec.describe Webpage, type: :model do
  describe '(validations)' do
    subject(:webpage) { Webpage.new(url: 'https://example.com') }

    it 'requires a url' do
      expect(subject).to be_valid
      subject.url = 'not a url'
      expect(subject).to_not be_valid
    end
  end

  describe '#html_validation_scanner', vcr: true do
    it 'is a HtmlValidationScan' do
      expect(subject.html_validation_scanner).to be_a(HtmlValidationScan)
    end
  end

  describe '#validate_html', vcr: true do
    it 'converts results errors to #issues' do
      subject.url = 'https://w3c-validators.github.io/w3c_validators/invalid_html5.html'
      subject.validate_html
      html_validation = subject.page_scans.last
      expect(html_validation.issues.count).to eql(2)
      expect(html_validation.issues).to contain_exactly(
        "End tag for  “body” seen, but there were unclosed elements.",
        "Unclosed element “section”."
      )
    end
  end
end
