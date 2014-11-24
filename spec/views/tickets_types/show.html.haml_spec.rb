require 'rails_helper'

RSpec.describe "tickets_types/show", :type => :view do
  before(:each) do
    @tickets_type = assign(:tickets_type, TicketsType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
