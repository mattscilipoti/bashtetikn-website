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
  describe '#perform_page_scan_link_to' do
    let(:mock_website) { Website.new(id: -1) }

    it 'creates a link' do
      expect(
        perform_page_scan_link_to(page_scan_class: HtmlValidationPageScan, scanned_model: mock_website)
      ).to have_tag(:a)
    end

    it 'creates a link to the passed scanner' do
      expect(
        perform_page_scan_link_to(page_scan_class: HtmlValidationPageScan, scanned_model: mock_website)
      ).to have_tag(:a, with: {
        href: html_validation_page_scan_website_path(mock_website.id)
      })
    end

    it 'creates a link with image with default caption, when not passed' do
      expect(
        perform_page_scan_link_to(page_scan_class: HtmlValidationPageScan, scanned_model: mock_website)
      ).to have_tag(:a, text: 'Perform Html Validation Page Scan')
    end

    it 'creates a link with the passed caption' do
      expect(
        perform_page_scan_link_to(caption: 'TEST CAPTION 1', page_scan_class: HtmlValidationPageScan, scanned_model: mock_website)
      ).to have_tag(:a, text: 'TEST CAPTION 1')
    end

    it "creates a link with a title/tooltip derived from the scanner, including the scan tool's URL" do
      expect(
        perform_page_scan_link_to(page_scan_class: HtmlValidationPageScan, scanned_model: mock_website, caption: 'TEST CAPTION')
      ).to have_tag(:a, with: {
        title: 'Perform Html Validation Page Scans for all pages (via https://validator.w3.org/nu/)'
      })
    end

    it 'creates a link, with the passed content' do
      expect(
        perform_page_scan_link_to(page_scan_class: HtmlValidationPageScan, scanned_model: mock_website) do
          content_tag(:span, 'TEST SPAN')
        end
      ).to have_tag(:a) do
        with_tag(:span, text: 'TEST SPAN')
      end
    end

    it "creates a link, with the scanner's icon" do
      expect(
        perform_page_scan_link_to(caption: 'TEST', page_scan_class: HtmlValidationPageScan, scanned_model: mock_website)
      ).to have_tag(:a) do
        with_tag("img[src*='icon']")
      end
    end
  end
end
