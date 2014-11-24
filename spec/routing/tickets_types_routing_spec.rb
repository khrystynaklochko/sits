require "rails_helper"

RSpec.describe TicketsTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tickets_types").to route_to("tickets_types#index")
    end

    it "routes to #new" do
      expect(:get => "/tickets_types/new").to route_to("tickets_types#new")
    end

    it "routes to #show" do
      expect(:get => "/tickets_types/1").to route_to("tickets_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tickets_types/1/edit").to route_to("tickets_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tickets_types").to route_to("tickets_types#create")
    end

    it "routes to #update" do
      expect(:put => "/tickets_types/1").to route_to("tickets_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tickets_types/1").to route_to("tickets_types#destroy", :id => "1")
    end

  end
end
