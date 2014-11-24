require 'rails_helper'

RSpec.describe "tickets_types/new", :type => :view do
  before(:each) do
    assign(:tickets_type, TicketsType.new())
  end

  it "renders new tickets_type form" do
    render

    assert_select "form[action=?][method=?]", tickets_types_path, "post" do
    end
  end
end
