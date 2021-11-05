require 'rails_helper'

RSpec.describe "validations/index", type: :view do
  before(:each) do
    assign(:validations, [
      Validation.create!(
        type: "Validation",
        url: "https://1.example.com",
        webpage: nil,
        warnings: [],
        issues: []
      ),
      Validation.create!(
        type: "Validation",
        url: "https://2.example.com",
        webpage: nil,
        warnings: [],
        issues: []
      )
    ])
  end

  it "renders a list of validations" do
    render
    # raise rendered

    assert_select "tr>td.type", text: /Validation/, count: 2
    assert_select "tr>td.url", text: /example.com/, count: 2
    assert_select "tr>td.webpage", text: nil.to_s, count: 2
    assert_select "tr>td.warnings", text: "0", count: 2
    assert_select "tr>td.issues", text: "0", count: 2
    assert_select "tr>td.actions", count: 2
  end
end
