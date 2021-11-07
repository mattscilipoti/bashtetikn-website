require 'rails_helper'
require 'vcr_helper'
require_relative '../shared/shared_examples_for_page_scans'

RSpec.describe HtmlValidationScan, type: :model do
  it_behaves_like 'Any PageScan'

  describe '#validator' do
    it 'is a Bashtetikn::HtmlValidatorFromW3C' do
      expect(subject.validator).to be_a(Bashtetikn::HtmlValidatorFromW3C)
    end
  end

  describe '#scan', vcr: true do
    it 'converts results errors to #issues' do
      subject.url = 'https://w3c-validators.github.io/w3c_validators/invalid_html5.html'
      subject.scan
      expect(subject.issues.count).to eql(2)
      expect(subject.issues).to contain_exactly(
        "End tag for  “body” seen, but there were unclosed elements.",
        "Unclosed element “section”."
      )
    end
  end
end
