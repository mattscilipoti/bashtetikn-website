require 'rails_helper'

RSpec.describe "page_scans/edit", type: :view do
  before(:each) do
    webpage = Webpage.create(name: "TEST PAGE", url: "https://example.com/edit")

    @page_scan = assign(:page_scan, PageScan.create!(
      type: "PageScan",
      url: "https://example.com/edit",
      webpage: webpage,
      warnings: [],
      issues: []
    ))
  end

  it "renders the edit page_scan form" do
    render

    assert_select "form[action=?][method=?]", page_scan_path(@page_scan), "post" do

      assert_select "input[name=?]", "page_scan[type]"

      assert_select "input[name=?]", "page_scan[url]"

      assert_select "select[name=?]", "page_scan[webpage_id]"

      assert_select "input[name=?]", "page_scan[warnings]"

      assert_select "input[name=?]", "page_scan[issues]"
    end
  end
end
