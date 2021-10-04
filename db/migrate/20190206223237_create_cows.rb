class CreateCows < ActiveRecord::Migration[5.2]
  def change
    create_table :cows do |t|
      t.integer :clicks
      t.string :url

      t.timestamps
    end
  end
end
