require 'rails_helper'

RSpec.describe "page_scans/index", type: :view do
  before(:each) do
    assign(:page_scans, [
      PageScan.create!(
        type: "HtmlValidationPageScan",
        url: "https://1.example.com",
        webpage: nil,
        warnings: [],
        issues: []
      ),
      PageScan.create!(
        type: "HtmlValidationPageScan",
        url: "https://2.example.com",
        webpage: nil,
        warnings: [],
        issues: []
      )
    ])
  end

  it "renders a list of page_scans" do
    render
    # raise rendered

    assert_select "tr>td.type", title: /Page Scan/, count: 2
    assert_select "tr>td.url", text: /example.com/, count: 2
    assert_select "tr>td.webpage", text: nil.to_s, count: 2
    assert_select "tr>td.warnings", text: "0", count: 2
    assert_select "tr>td.issues", text: "0", count: 2
    assert_select "tr>td.actions", count: 2
  end
end
