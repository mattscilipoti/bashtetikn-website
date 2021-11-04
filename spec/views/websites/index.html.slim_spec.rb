require 'rails_helper'

RSpec.describe "websites/index", type: :view do
  before(:each) do
    assign(:websites, [
      Website.create!(
        name: "Name",
        url: "Url"
      ),
      Website.create!(
        name: "Name",
        url: "Url"
      )
    ])
  end

  it "renders a list of websites" do
    render
    
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
  end
end
