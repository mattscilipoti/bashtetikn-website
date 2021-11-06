require 'rails_helper'

RSpec.describe "page_scans/show", type: :view do
  before(:each) do
    @page_scan = assign(:page_scan, PageScan.create!(
      type: "PageScan",
      url: "https://show.example.com",
      webpage: nil,
      warnings: "",
      issues: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
