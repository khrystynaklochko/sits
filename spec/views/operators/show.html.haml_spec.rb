require 'rails_helper'

RSpec.describe "operators/show", :type => :view do
  before(:each) do
    @operator = assign(:operator, Operator.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
