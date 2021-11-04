require 'rails_helper'

RSpec.describe "validations/show", type: :view do
  before(:each) do
    @validation = assign(:validation, Validation.create!(
      type: "Type",
      url: "Url",
      webpage: nil,
      warnings: "",
      errors: ""
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
