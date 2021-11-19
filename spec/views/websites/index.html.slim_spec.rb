require 'rails_helper'

RSpec.describe "websites/index", type: :view do
  before(:each) do
    assign(:websites, [
      Website.create!(
        name: "Name 1",
        url: "https://1.example.com"
      ),
      Website.create!(
        name: "Name 2",
        url: "https://2.example.com"
      )
    ])
  end

  it "renders a list of websites" do
    render
    
    assert_select "tr>td", text: /Name/, count: 2
    assert_select "tr>td", text: /example.com/, count: 2
  end
end
