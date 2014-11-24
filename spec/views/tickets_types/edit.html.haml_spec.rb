require 'rails_helper'

RSpec.describe "tickets_types/edit", :type => :view do
  before(:each) do
    @tickets_type = assign(:tickets_type, TicketsType.create!())
  end

  it "renders the edit tickets_type form" do
    render

    assert_select "form[action=?][method=?]", tickets_type_path(@tickets_type), "post" do
    end
  end
end
