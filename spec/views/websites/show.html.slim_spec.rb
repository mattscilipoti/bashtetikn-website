require 'rails_helper'

RSpec.describe "websites/show", type: :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      name: "Name",
      url: "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
  end
end
