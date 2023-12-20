require 'rails_helper'
require 'rspec-html-matchers'

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
end

# Specs in this file have access to the `helper` object that includes
# the ApplicationHelper.

RSpec.describe ApplicationHelper, type: :helper do
  describe '#datetime_el' do
    describe '(defaults)' do
      it 'creates a span' do
        expect(helper.datetime_el(Time.now)).to have_tag(:span)
      end

      it 'includes seconds' do
        expect(helper).to receive(:time_ago_in_words).with(anything, include_seconds: true)
        helper.datetime_el(Time.now)
      end
    end

    it 'returns nil if passed datetime is nil/blank' do
      expect(helper.datetime_el(nil)).to be nil
      expect(helper.datetime_el('')).to be nil
      expect(helper.datetime_el('  ')).to be nil
    end

    it 'converts DateTime to time ago in words' do
      expect(helper.datetime_el(15.seconds.ago)).to have_tag(:span, text: 'less than 20 seconds ago')
      expect(helper.datetime_el(1.minute.ago)).to have_tag(:span, text: '1 minute ago')
      expect(helper.datetime_el(62.minutes.ago)).to have_tag(:span, text: 'about 1 hour ago')
    end
  end
end
