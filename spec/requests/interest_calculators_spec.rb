require 'spec_helper'

describe "InterestCalculators" do
  describe "GET /interest_calculators" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get interest_calculators_path
      response.status.should be(200)
    end
  end
end