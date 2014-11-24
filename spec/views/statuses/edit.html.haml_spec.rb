require 'rails_helper'

RSpec.describe "statuses/edit", :type => :view do
  before(:each) do
    @status = assign(:status, Status.create!())
  end

  it "renders the edit status form" do
    render

    assert_select "form[action=?][method=?]", status_path(@status), "post" do
    end
  end
end
