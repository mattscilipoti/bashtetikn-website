require 'rails_helper'

RSpec.describe "webpages/edit", type: :view do
  before(:each) do
    @webpage = assign(:webpage, Webpage.create!(
      name: "MyString",
      url: "MyString"
    ))
  end

  it "renders the edit webpage form" do
    render

    assert_select "form[action=?][method=?]", webpage_path(@webpage), "post" do

      assert_select "input[name=?]", "webpage[name]"

      assert_select "input[name=?]", "webpage[url]"
    end
  end
end
