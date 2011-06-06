class CreateInterestCalculators < ActiveRecord::Migration
  def self.up
    create_table :interest_calculators do |t|
      t.float :interestAfter
      t.float :amount
      t.float :payment
      t.float :specialPayment
      t.integer :paymentMethod

      t.timestamps
    end
  end

  def self.down
    drop_table :interest_calculators
  end
end
