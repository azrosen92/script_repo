require 'spec_helper'

describe "scripts/edit" do
  before(:each) do
    @script = assign(:script, stub_model(Script,
      :name => "MyString",
      :file_path => "MyString",
      :size => 1,
      :downloads => 1
    ))
  end

  it "renders the edit script form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scripts_path(@script), :method => "post" do
      assert_select "input#script_name", :name => "script[name]"
      assert_select "input#script_file_path", :name => "script[file_path]"
      assert_select "input#script_size", :name => "script[size]"
      assert_select "input#script_downloads", :name => "script[downloads]"
    end
  end
end
