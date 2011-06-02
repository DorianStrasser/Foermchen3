require 'spec_helper'

describe "interest_calculators/show.html.haml" do
  before(:each) do
    @interest_calculator = assign(:interest_calculator, stub_model(InterestCalculator,
      :interest1 => 1.5,
      :interest2 => 1.5,
      :interest1duration => 1,
      :interest2duration => 1,
      :interestAfter => 1.5,
      :amount => 1.5,
      :payment => 1.5,
      :specialPayment => 1.5,
      :paymentMethod => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
