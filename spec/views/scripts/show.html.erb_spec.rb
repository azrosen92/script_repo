require 'spec_helper'

describe "scripts/show" do
  before(:each) do
    @script = assign(:script, stub_model(Script,
      :name => "Name",
      :file_path => "File Path",
      :size => 1,
      :downloads => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/File Path/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
