require 'spec_helper'

describe "interest_calculators/new.html.haml" do
  before(:each) do
    assign(:interest_calculator, stub_model(InterestCalculator,
      :interest1 => 1.5,
      :interest2 => 1.5,
      :interest1duration => 1,
      :interest2duration => 1,
      :interestAfter => 1.5,
      :amount => 1.5,
      :payment => 1.5,
      :specialPayment => 1.5,
      :paymentMethod => 1
    ).as_new_record)
  end

  it "renders new interest_calculator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interest_calculators_path, :method => "post" do
      assert_select "input#interest_calculator_interest1", :name => "interest_calculator[interest1]"
      assert_select "input#interest_calculator_interest2", :name => "interest_calculator[interest2]"
      assert_select "input#interest_calculator_interest1duration", :name => "interest_calculator[interest1duration]"
      assert_select "input#interest_calculator_interest2duration", :name => "interest_calculator[interest2duration]"
      assert_select "input#interest_calculator_interestAfter", :name => "interest_calculator[interestAfter]"
      assert_select "input#interest_calculator_amount", :name => "interest_calculator[amount]"
      assert_select "input#interest_calculator_payment", :name => "interest_calculator[payment]"
      assert_select "input#interest_calculator_specialPayment", :name => "interest_calculator[specialPayment]"
      assert_select "input#interest_calculator_paymentMethod", :name => "interest_calculator[paymentMethod]"
    end
  end
end
