require 'rails_helper'
# require_relative '../../app/helpers/font_awesome_helpers'
require 'rspec-html-matchers'
RSpec.configure do |config|
  config.include RSpecHtmlMatchers
end

RSpec.describe FontAwesomeHelper, type: :helper do
  describe '::IconTypeAbbreviations' do
    it 'supports :solid' do
      expect(FontAwesomeHelper::IconTypeAbbreviations[:solid]).to eql(:fas)
    end

    it 'supports :brand' do
      expect(FontAwesomeHelper::IconTypeAbbreviations[:brand]).to eql(:fab)
    end
  end

  describe '#font_awesome_icon' do
    let(:mock_website) { Website.new(id: -1) }

    it 'creates an image link' do
      expect(
        helper.font_awesome_icon('camera-retro')
      ).to have_tag(:i)
    end

    it 'creates an image link with the FA class for the requested icon' do
      expect(
        helper.font_awesome_icon('camera-retro')
      ).to have_tag(:i, with: { class: 'fa-camera-retro'} )
    end

    it 'creates an image link with the FA class, for the icon type (defaults to :solid)' do
      expect(
        helper.font_awesome_icon('camera-retro')
      ).to have_tag(:i, with: { class: 'fas'} )
    end

    it 'creates an image link with the FA class, for the passed icon type' do
      expect(
        helper.font_awesome_icon('camera-retro', icon_type: :regular)
      ).to have_tag(:i, with: { class: 'far'} )
    end

    it 'creates an image link, without a caption, by default' do
      expect(
        helper.font_awesome_icon('camera-retro')
      ).to have_tag(:i, text: nil)
    end

    it 'creates an image link, with the passed caption' do
      expect(
        helper.font_awesome_icon('camera-retro', caption: 'TEST CAPTION')
      ).to have_tag(:i, text: /TEST CAPTION/)
    end
  end
end
