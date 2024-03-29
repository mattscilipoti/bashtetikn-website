require 'rails_helper'
require 'rspec/its'
require 'rspec/json_expectations'
require 'vcr_helper'
require_relative '../shared/shared_examples_for_page_scans'

RSpec.describe HtmlValidationPageScan, type: :model do
  it_behaves_like 'Any PageScan'

  its(:icon_name) { should eql('w3c_validator_nu_icon') }

  context '(with issues)' do
    before(:each) do
      subject.issues = issues
    end

    let(:issues) {
      [
        'An “img” element must have an “alt” attribute, except under certain conditions. For details, consult guidance on providing text alternatives for images.',
        'An “input” element with a “type” attribute whose value is “hidden” must not have an “autocomplete” attribute whose value is “on” or “off”.',
        'Another issue',
        'An “input” element with a “type” attribute whose value is “hidden” must not have an “autocomplete” attribute whose value is “on” or “off”.',
      ]
    }

    describe '#issues, w/filter' do
      it 'errors for unsupported filter' do
        expect { 
          subject.issues(filter: :bad_filter) 
        }.to raise_error ArgumentError, /unsupported/i
      end

      it 'can filter issues' do
        filtered_issues = subject.issues(filter: :image_alt_attribute)
        expect(filtered_issues.size).to eql(1)
        expect(filtered_issues).to contain_exactly(issues[0])
      end
    end

    it '#issues_missing_img_alt' do
      filtered_issues = subject.issues(filter: :image_alt_attribute)
      expect(filtered_issues.size).to eql(1)
      expect(filtered_issues).to contain_exactly(issues[0])
    end

    describe '#issues_missing_img_alt_percentage' do
      it 'should calculate correctly for very small percentages' do
        # Tests for known issue: (497/498==0, 497/498.0==0.99799)
        # Stub Workaround: populate with array of the correct size
        allow(subject).to receive(:issues).and_return((1..498).to_a)
        allow(subject).to receive(:issues_missing_img_alt).and_return((1..497).to_a)
        expect(subject.issues_missing_img_alt_percentage).to eql(497/498.0*100)
      end

      it 'should handle divide by zero scenario, returning 0 when there are no issues' do
        # Stub Workaround: populate with array of the correct size
        allow(subject).to receive(:issues).and_return([])
        allow(subject).to receive(:issues_missing_img_alt).and_return([1])
        expect(subject.issues_missing_img_alt_percentage).to eql(0)
      end

      it 'should return 0.0 when there are no issues for missing alt image' do
        # Stub Workaround: populate with array of the correct size
        allow(subject).to receive(:issues).and_return([1])
        allow(subject).to receive(:issues_missing_img_alt).and_return([])
        expect(subject.issues_missing_img_alt_percentage).to eql(0.0)
      end
    end

    it '#issues_with_hidden_input_and_autocomplete' do
      filtered_issues = subject.issues(filter: :hidden_autocomplete)
      expect(filtered_issues.size).to eql(2)
      expect(filtered_issues).to contain_exactly(issues[1],issues[3])
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

    it 'populates #raw_results' do
      subject.url = 'https://w3c-validators.github.io/w3c_validators/invalid_html5.html'
      subject.scan
      expect(subject.raw_results).to include_json(
        messages: /error/,
        uri: subject.url,
        validity: false
      )
    end
  end

  describe '#scan_results_uri, provides the URI to the scan_results' do
    subject(:scan_results_uri) { HtmlValidationPageScan.new(url: 'https://example.com').scan_results_uri }
    its(:scheme) { should eql('https') }
    its(:host) { should eql('validator.w3.org') }
    its(:path) { should eql('/nu/') } # WARN: Nu Html Checker requires the trailing slash before query params
    its(:request_uri) { should start_with('/nu/?doc=http') }
    it 'query includes encoded URI to the page' do
      expect(subject.query).to eql('doc=https%3A%2F%2Fexample.com')
    end
  end

  describe '#validator' do
    it 'is a Bashtetikn::HtmlValidatorFromW3C' do
      expect(subject.validator).to be_a(Bashtetikn::HtmlValidatorFromW3C)
    end
  end

  describe '#validator_name' do
    it 'is W3C Nu Validator' do
      expect(subject.validator_name.to_s).to eql('W3C Nu Validator')
    end
  end

  describe '#validator_uri' do
    it 'is the W3C Nu Validator' do
      expect(subject.validator_uri.to_s).to eql('https://validator.w3.org/nu/')
    end
  end
end
