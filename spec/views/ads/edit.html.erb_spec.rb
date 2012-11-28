require 'spec_helper'

describe "ads/edit" do
  before(:each) do
    @ad = assign(:ad, stub_model(Ad,
      :image => "MyString",
      :url => "MyString",
      :title => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ads_path(@ad), :method => "post" do
      assert_select "input#ad_image", :name => "ad[image]"
      assert_select "input#ad_url", :name => "ad[url]"
      assert_select "input#ad_title", :name => "ad[title]"
      assert_select "input#ad_name", :name => "ad[name]"
    end
  end
end
