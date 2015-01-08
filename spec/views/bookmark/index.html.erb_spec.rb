require "rails_helper"

RSpec.describe "gadgets/list" do
  it "renders the gadget partial for each gadget" do
    assign(:gadgets, [
      double(:name => "First"),
      double(:name => "Second")
    ])
    stub_template "gadgets/_gadget.html.erb" => "<%= gadget.name %><br/>"
    render
    expect(rendered).to match /First/
    expect(rendered).to match /Second/
  end
end