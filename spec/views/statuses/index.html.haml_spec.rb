require 'rails_helper'

RSpec.describe "statuses/index", :type => :view do
  before(:each) do
    assign(:statuses, [
      Status.create!(),
      Status.create!()
    ])
  end

  it "renders a list of statuses" do
    render
  end
end
