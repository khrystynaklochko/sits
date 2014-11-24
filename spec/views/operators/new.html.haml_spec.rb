require 'rails_helper'

RSpec.describe "operators/new", :type => :view do
  before(:each) do
    assign(:operator, Operator.new())
  end

  it "renders new operator form" do
    render

    assert_select "form[action=?][method=?]", operators_path, "post" do
    end
  end
end
