require 'rails_helper'

RSpec.describe "validations/edit", type: :view do
  before(:each) do
    webpage = Webpage.create(name: "TEST PAGE", url: "https://example.com/edit")

    @validation = assign(:validation, Validation.create!(
      type: "Validation",
      url: "https://example.com/edit",
      webpage: webpage,
      warnings: [],
      issues: []
    ))
  end

  it "renders the edit validation form" do
    render

    assert_select "form[action=?][method=?]", validation_path(@validation), "post" do

      assert_select "input[name=?]", "validation[type]"

      assert_select "input[name=?]", "validation[url]"

      assert_select "select[name=?]", "validation[webpage_id]"

      assert_select "input[name=?]", "validation[warnings]"

      assert_select "input[name=?]", "validation[issues]"
    end
  end
end
