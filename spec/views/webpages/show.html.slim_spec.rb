require 'rails_helper'

RSpec.describe "webpages/show", type: :view do
  before(:each) do
    @webpage = assign(:webpage, Webpage.create!(
      name: "TEST PAGE",
      url: "https://example.com"
    ))
  end

  it "renders name as h1" do
    render
    expect(rendered).to have_css('h1', text: /TEST PAGE/)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_css('p', text: /example.com/)
  end
end
