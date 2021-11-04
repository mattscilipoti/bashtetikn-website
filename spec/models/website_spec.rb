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
end
