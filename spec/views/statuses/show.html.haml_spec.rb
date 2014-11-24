require 'rails_helper'

RSpec.describe "statuses/show", :type => :view do
  before(:each) do
    @status = assign(:status, Status.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
