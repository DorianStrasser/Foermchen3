class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.float :interest
      t.float :duration
      t.integer :interest_calculator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
