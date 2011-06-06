require 'spec_helper'

describe OfferController do

  describe "GET 'save'" do
    it "should be successful" do
      get 'save'
      response.should be_success
    end
  end

  describe "GET 'open'" do
    it "should be successful" do
      get 'open'
      response.should be_success
    end
  end

  describe "GET 'delete'" do
    it "should be successful" do
      get 'delete'
      response.should be_success
    end
  end

end
