require 'rails_helper'

RSpec.describe "validations/edit", type: :view do
  before(:each) do
    @validation = assign(:validation, Validation.create!(
      type: "",
      url: "MyString",
      webpage: nil,
      warnings: "",
      errors: ""
    ))
  end

  it "renders the edit validation form" do
    render

    assert_select "form[action=?][method=?]", validation_path(@validation), "post" do

      assert_select "input[name=?]", "validation[type]"

      assert_select "input[name=?]", "validation[url]"

      assert_select "input[name=?]", "validation[webpage_id]"

      assert_select "input[name=?]", "validation[warnings]"

      assert_select "input[name=?]", "validation[errors]"
    end
  end
end
