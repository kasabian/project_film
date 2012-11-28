require 'spec_helper'

describe "slides/index" do
  before(:each) do
    assign(:slides, [
      stub_model(Slide,
        :image => "Image",
        :is_show => false
      ),
      stub_model(Slide,
        :image => "Image",
        :is_show => false
      )
    ])
  end

  it "renders a list of slides" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
