require 'rails_helper'

RSpec.describe "validations/new", type: :view do
  before(:each) do
    assign(:validation, Validation.new(
      type: "",
      url: "MyString",
      webpage: nil,
      warnings: "",
      errors: ""
    ))
  end

  it "renders new validation form" do
    render

    assert_select "form[action=?][method=?]", validations_path, "post" do

      assert_select "input[name=?]", "validation[type]"

      assert_select "input[name=?]", "validation[url]"

      assert_select "input[name=?]", "validation[webpage_id]"

      assert_select "input[name=?]", "validation[warnings]"

      assert_select "input[name=?]", "validation[errors]"
    end
  end
end
