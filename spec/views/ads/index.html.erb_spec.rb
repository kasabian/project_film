require 'spec_helper'

describe "ads/index" do
  before(:each) do
    assign(:ads, [
      stub_model(Ad,
        :image => "Image",
        :url => "Url",
        :title => "Title",
        :name => "Name"
      ),
      stub_model(Ad,
        :image => "Image",
        :url => "Url",
        :title => "Title",
        :name => "Name"
      )
    ])
  end

  it "renders a list of ads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
