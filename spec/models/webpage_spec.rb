require 'rails_helper'
require 'vcr_helper'
require 'rspec/its'

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

  describe '.last_scans' do
    context 'no scans' do
      subject(:webpage) { Webpage.new }
      its(:last_scans) { should be_empty }
    end

    context 'only one scan scans' do
      let(:single_scan) { HtmlValidationScan.new(url: 'https://page_scan.example.com') }
      subject(:webpage) do
        Webpage.create!(url: 'https://page.example.com').tap {|page| page.page_scans << single_scan }
      end
      its(:last_scans) { should contain_exactly(single_scan) }
    end

    context 'multiple scans, of multiple types' do
      class TestScanner < PageScan; end
      let(:type_a_1) { PageScan.new(type: 'HtmlValidationScan', url: 'https://a1.example.com', created_at: 5.minutes.ago) }
      let(:type_a_2) { PageScan.new(type: 'HtmlValidationScan', url: 'https://a2.example.com') }
      let(:type_b_1) { PageScan.new(type: 'TestScanner', url: 'https://b1.example.com') }
      let(:type_b_2) { PageScan.new(type: 'TestScanner', url: 'https://b2.example.com', created_at: 5.minutes.ago) }

      subject(:webpage) do
        Webpage.create!(url: 'https://page.example.com').tap {|page| page.page_scans = [type_a_1, type_a_2, type_b_1, type_b_2] }
      end
      it 'includes the last scan of each type' do
        expect(webpage.last_scans).to contain_exactly(type_a_2, type_b_1)
      end
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
