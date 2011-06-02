require 'spec_helper'

describe "interest_calculators/index.html.haml" do
  before(:each) do
    assign(:interest_calculators, [
      stub_model(InterestCalculator,
        :interest1 => 1.5,
        :interest2 => 1.5,
        :interest1duration => 1,
        :interest2duration => 1,
        :interestAfter => 1.5,
        :amount => 1.5,
        :payment => 1.5,
        :specialPayment => 1.5,
        :paymentMethod => 1
      ),
      stub_model(InterestCalculator,
        :interest1 => 1.5,
        :interest2 => 1.5,
        :interest1duration => 1,
        :interest2duration => 1,
        :interestAfter => 1.5,
        :amount => 1.5,
        :payment => 1.5,
        :specialPayment => 1.5,
        :paymentMethod => 1
      )
    ])
  end

  it "renders a list of interest_calculators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
