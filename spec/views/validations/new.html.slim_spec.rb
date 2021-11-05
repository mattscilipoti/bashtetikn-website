require 'rails_helper'

RSpec.describe "validations/new", type: :view do
  before(:each) do
    assign(:validation, Validation.new(
      type: "Validation",
      url: "https://new.example.com",
      webpage: Webpage.first,
      warnings: [],
      issues: []
    ))
  end

  it "renders new validation form" do
    render

    assert_select "form[action=?][method=?]", validations_path, "post" do

      assert_select "input[name=?]", "validation[type]"

      assert_select "input[name=?]", "validation[url]"

      assert_select "select[name=?]", "validation[webpage_id]"

      assert_select "input[name=?]", "validation[warnings]"

      assert_select "input[name=?]", "validation[issues]"
    end
  end
end
