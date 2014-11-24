require 'rails_helper'

RSpec.describe "operators/index", :type => :view do
  before(:each) do
    assign(:operators, [
      Operator.create!(),
      Operator.create!()
    ])
  end

  it "renders a list of operators" do
    render
  end
end
