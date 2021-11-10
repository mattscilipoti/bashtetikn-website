require 'rails_helper'
require 'rspec/its'
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

  describe '#scan_results_uri, provides the URI to the scan_results' do
    subject(:scan_results_uri) { HtmlValidationScan.new(url: 'https://example.com').scan_results_uri }
    its(:scheme) { should eql('https') }
    its(:host) { should eql('validator.w3.org') }
    its(:path) { should eql('/nu/') } # WARN: Nu Html Checker requires the trailing slash before query params
    its(:request_uri) { should start_with('/nu/?doc=http') }
    it 'query includes encoded URI to the page' do
      expect(subject.query).to eql('doc=https%3A%2F%2Fexample.com')
    end
  end
end
