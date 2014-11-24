require 'rails_helper'

RSpec.describe "tickets_types/index", :type => :view do
  before(:each) do
    assign(:tickets_types, [
      TicketsType.create!(),
      TicketsType.create!()
    ])
  end

  it "renders a list of tickets_types" do
    render
  end
end
