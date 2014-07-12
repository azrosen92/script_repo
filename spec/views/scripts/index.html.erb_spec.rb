require 'spec_helper'

describe "scripts/index" do
  before(:each) do
    assign(:scripts, [
      stub_model(Script,
        :name => "Name",
        :file_path => "File Path",
        :size => 1,
        :downloads => 2
      ),
      stub_model(Script,
        :name => "Name",
        :file_path => "File Path",
        :size => 1,
        :downloads => 2
      )
    ])
  end

  it "renders a list of scripts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "File Path".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
