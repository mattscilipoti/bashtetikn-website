require 'rails_helper'

RSpec.describe "page_scans/new", type: :view do
  before(:each) do
    assign(:page_scan, PageScan.new(
      type: "PageScan",
      url: "https://new.example.com",
      webpage: Webpage.first,
      warnings: [],
      issues: []
    ))
  end

  it "renders new page_scan form" do
    render

    assert_select "form[action=?][method=?]", page_scans_path, "post" do

      assert_select "input[name=?]", "page_scan[type]"

      assert_select "input[name=?]", "page_scan[url]"

      assert_select "select[name=?]", "page_scan[webpage_id]"

      assert_select "input[name=?]", "page_scan[warnings]"

      assert_select "input[name=?]", "page_scan[issues]"
    end
  end
end
