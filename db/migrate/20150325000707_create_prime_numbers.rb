class CreatePrimeNumbers < ActiveRecord::Migration
  def change
    create_table :prime_numbers do |t|

      t.timestamps null: false
    end
  end
end
