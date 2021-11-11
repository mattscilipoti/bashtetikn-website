require 'rails_helper'

RSpec.describe "websites/show", type: :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      name: "TEST NAME",
      url: "https://example.com",
      webpages: [Webpage.create!(url: 'https://example.com')]
    ))
  end

  it "renders name as h1" do
    render
    expect(rendered).to have_css('h1', text: /TEST NAME/)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_css('p', text: /example.com/)
  end

  it "renders list of Webpages" do
    render
    expect(rendered).to have_css('h2', text: /Webpages/)
    expect(rendered).to have_css('ol li.webpage', count: 1)
  end

  it "renders table of Scans" do
    render
    expect(rendered).to have_css('h2', text: /Webpage Scans/)
    expect(rendered).to have_css('table.scans')
  end
end
