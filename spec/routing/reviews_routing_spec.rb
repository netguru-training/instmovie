require "rails_helper"

RSpec.describe ReviewsController, type: :routing do
  describe "routing" do

    xit "routes to #index" do
      expect(:get => "/reviews").to route_to("reviews#index")
    end

    xit "routes to #new" do
      expect(:get => "/reviews/new").to route_to("reviews#new")
    end

    xit "routes to #show" do
      expect(:get => "/reviews/1").to route_to("reviews#show", :id => "1")
    end

    xit "routes to #edit" do
      expect(:get => "/reviews/1/edit").to route_to("reviews#edit", :id => "1")
    end

    xit "routes to #create" do
      expect(:post => "/reviews").to route_to("reviews#create")
    end

    xit "routes to #update" do
      expect(:put => "/reviews/1").to route_to("reviews#update", :id => "1")
    end

    xit "routes to #destroy" do
      expect(:delete => "/reviews/1").to route_to("reviews#destroy", :id => "1")
    end

  end
end
