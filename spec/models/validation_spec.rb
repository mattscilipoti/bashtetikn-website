require 'rails_helper'

RSpec.describe Validation, type: :model do
  describe '(validations)' do
    subject(:validation) { Validation.new(url: 'https://example.com') }

    it 'requires a url' do
      expect(subject).to be_valid
      subject.url = 'not a url'
      expect(subject).to_not be_valid
    end
  end
end
