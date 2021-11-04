require 'rails_helper'

RSpec.describe "webpages/index", type: :view do
  before(:each) do
    assign(:webpages, [
      Webpage.create!(
        name: "Name 1",
        url: "https://1.example.com"
      ),
      Webpage.create!(
        name: "Name 2",
        url: "https://2.example.com"
      )
    ])
  end

  it "renders a list of webpages" do
    render
    assert_select "tr>td", text: /Name/, count: 2
    assert_select "tr>td", text: /example.com/, count: 2
  end
end
