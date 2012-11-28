require 'spec_helper'

describe "ads/show" do
  before(:each) do
    @ad = assign(:ad, stub_model(Ad,
      :image => "Image",
      :url => "Url",
      :title => "Title",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/Url/)
    rendered.should match(/Title/)
    rendered.should match(/Name/)
  end
end
