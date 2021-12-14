require 'rails_helper'

RSpec.describe "page_scans/show", type: :view do
  before(:each) do
    @page_scan = assign(:page_scan, PageScan.create!(
      type: "HtmlValidationPageScan",
      url: "https://show.example.com",
      webpage: nil,
      warnings: "",
      issues: ""
    ))
  end

  it "renders attributes in <p>" do
    render

    assert_select "p", text: /Url/
    assert_select "p", text: /Webpage/
    assert_select "p", text: /Scan results/i
    assert_select "h2", text: /Issues\(0\)/
    assert_select "h2", text: /Warnings\(0\)/
  end
end
