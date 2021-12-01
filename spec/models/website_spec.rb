require 'rails_helper'

RSpec.describe Website, type: :model do
  describe '(validations)' do
    subject(:website) do
      Website.new(
        name: 'TEST NAME',
        url: 'https://example.com'
      )
    end

    it 'requires a name' do
      expect(subject).to be_valid
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'requires a url' do
      expect(subject).to be_valid
      subject.url = 'not a url'
      expect(subject).to_not be_valid
    end
  end

  describe '(instance methods)' do
    subject(:website) { Website.new(name: 'TEST', url: 'https://example.com') }

    describe '#to_param' do
      it 'starts with the ID' do
        subject.id = 12
        expect(subject.to_param).to start_with('12-')
      end

      it 'ends with #name (parameterized)' do
        subject.name = 'TEST SITE'
        expect(subject.to_param).to end_with('test-site')
      end
    end

    describe '#html_validation_page_scan', vcr: true do
      before(:each) do
        subject.save!
        subject.webpages.create!(url: 'https://w3c-validators.github.io/w3c_validators/valid_html5.html')
        subject.webpages.create!(url: 'https://w3c-validators.github.io/w3c_validators/invalid_html5.html')
        subject.webpages.create!(url: 'https://w3c-validators.github.io/w3c_validators/valid_markup.html')
      end

      it 'calls #html_validation_page_scan on each page' do
        subject.webpages.each do |webpage|
          expect(webpage).to receive(:html_validation_page_scan)
        end
        subject.html_validation_page_scan
      end

      it 'performs a PageScan for each Webpage, asynchronously' do
        ActiveJob::Base.queue_adapter = :test
        subject.html_validation_page_scan
        expect(PageScanJob).to(have_been_enqueued.exactly(3).times)
      end
    end
  end
end
