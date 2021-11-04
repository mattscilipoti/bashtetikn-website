require 'rails_helper'

RSpec.describe "webpages/new", type: :view do
  before(:each) do
    assign(:webpage, Webpage.new(
      name: "TEST NEW PAGE",
      url: "https://example.com"
    ))
  end

  it "renders new webpage form" do
    render

    assert_select "form[action=?][method=?]", webpages_path, "post" do

      assert_select "input[name=?]", "webpage[name]"

      assert_select "input[name=?]", "webpage[url]"
    end
  end
end
