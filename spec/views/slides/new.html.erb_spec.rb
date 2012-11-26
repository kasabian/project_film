require 'spec_helper'

describe "slides/new" do
  before(:each) do
    assign(:slide, stub_model(Slide,
      :image => "MyString",
      :is_show => false
    ).as_new_record)
  end

  it "renders new slide form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slides_path, :method => "post" do
      assert_select "input#slide_image", :name => "slide[image]"
      assert_select "input#slide_is_show", :name => "slide[is_show]"
    end
  end
end
