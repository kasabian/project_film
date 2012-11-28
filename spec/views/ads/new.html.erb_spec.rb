require 'spec_helper'

describe "ads/new" do
  before(:each) do
    assign(:ad, stub_model(Ad,
      :image => "MyString",
      :url => "MyString",
      :title => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ads_path, :method => "post" do
      assert_select "input#ad_image", :name => "ad[image]"
      assert_select "input#ad_url", :name => "ad[url]"
      assert_select "input#ad_title", :name => "ad[title]"
      assert_select "input#ad_name", :name => "ad[name]"
    end
  end
end
