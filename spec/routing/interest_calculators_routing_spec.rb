require "spec_helper"

describe InterestCalculatorsController do
  describe "routing" do

    it "routes to #index" do
      get("/interest_calculators").should route_to("interest_calculators#index")
    end

    it "routes to #new" do
      get("/interest_calculators/new").should route_to("interest_calculators#new")
    end

    it "routes to #show" do
      get("/interest_calculators/1").should route_to("interest_calculators#show", :id => "1")
    end

    it "routes to #edit" do
      get("/interest_calculators/1/edit").should route_to("interest_calculators#edit", :id => "1")
    end

    it "routes to #create" do
      post("/interest_calculators").should route_to("interest_calculators#create")
    end

    it "routes to #update" do
      put("/interest_calculators/1").should route_to("interest_calculators#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/interest_calculators/1").should route_to("interest_calculators#destroy", :id => "1")
    end

  end
end
