require 'rails_helper'

RSpec.describe "webpages/index", type: :view do
  before(:each) do
    assign(:webpages, [
      Webpage.create!(
        name: "Name",
        url: "Url"
      ),
      Webpage.create!(
        name: "Name",
        url: "Url"
      )
    ])
  end

  it "renders a list of webpages" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
  end
end
