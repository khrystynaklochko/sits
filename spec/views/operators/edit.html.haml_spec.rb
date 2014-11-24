require 'rails_helper'

RSpec.describe "operators/edit", :type => :view do
  before(:each) do
    @operator = assign(:operator, Operator.create!())
  end

  it "renders the edit operator form" do
    render

    assert_select "form[action=?][method=?]", operator_path(@operator), "post" do
    end
  end
end
