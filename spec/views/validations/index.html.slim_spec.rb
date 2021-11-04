require 'rails_helper'

RSpec.describe "validations/index", type: :view do
  before(:each) do
    assign(:validations, [
      Validation.create!(
        type: "Type",
        url: "Url",
        webpage: nil,
        warnings: "",
        errors: ""
      ),
      Validation.create!(
        type: "Type",
        url: "Url",
        webpage: nil,
        warnings: "",
        errors: ""
      )
    ])
  end

  it "renders a list of validations" do
    render
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
