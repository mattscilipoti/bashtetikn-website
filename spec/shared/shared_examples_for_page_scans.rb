RSpec.shared_examples 'Any PageScan' do
  describe '(validations)' do
    subject(:page_scan) { PageScan.new(url: 'https://example.com') }

    it 'requires a url' do
      expect(subject).to be_valid
      subject.url = 'not a url'
      expect(subject).to_not be_valid
    end

    it 'responds_to :icon_name' do
      expect(subject).to respond_to :icon_name
    end

    it 'responds_to :scan' do
      expect(subject).to respond_to :scan
    end

    it 'responds_to :scan_results_uri' do
      expect(subject).to respond_to :scan_results_uri
    end

    it 'responds_to :state' do
      expect(subject).to respond_to :scan_results_uri
    end

    it 'responds_to :validator' do
      expect(subject).to respond_to :scan_results_uri
    end

    it 'responds_to :validator_uri' do
      expect(subject).to respond_to :scan_results_uri
    end
  end
end
