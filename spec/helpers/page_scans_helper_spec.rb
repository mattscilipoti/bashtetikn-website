require 'rails_helper'
require 'rspec-html-matchers'
RSpec.configure do |config|
  config.include RSpecHtmlMatchers
end

# Specs in this file have access to a helper object that includes
# the PageScansHelper. For example:
#
# describe PageScansHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PageScansHelper, type: :helper do
  describe '#page_scan_link_to' do
    let(:mock_website) { Website.new(id: -1) }

    it 'creates a link' do
      expect(
        page_scan_link_to(page_scan_class: HtmlValidationScan, model: mock_website, caption: 'TEST')
      ).to have_tag(:a)
    end

    it 'creates a link to the passed scanner' do
      expect(
        page_scan_link_to(page_scan_class: HtmlValidationScan, model: mock_website, caption: 'TEST')
      ).to have_tag(:a, with: {
        href: html_validation_scan_website_path(mock_website.id)
      })
    end

    it 'creates a link with the passed caption' do
      expect(
        page_scan_link_to(page_scan_class: HtmlValidationScan, model: mock_website, caption: 'TEST CAPTION')
      ).to have_tag(:a, text: 'TEST CAPTION')
    end

    it 'creates a link with a title derived from the scanner' do
      expect(
        page_scan_link_to(page_scan_class: HtmlValidationScan, model: mock_website, caption: 'TEST CAPTION')
      ).to have_tag(:a, with: {
        title: 'Html Validation Scan all pages'
      })
    end

    it 'creates a link, with the passed content' do
      expect(
        page_scan_link_to(page_scan_class: HtmlValidationScan, model: mock_website) do
          content_tag(:span, 'TEST SPAN')
        end
      ).to have_tag(:a) do
        with_tag(:span, text: 'TEST SPAN')
      end
    end
  end
end
