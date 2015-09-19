class CreateCrimeHistories < ActiveRecord::Migration
  def change
    create_table :crime_histories do |t|
      t.string :crime_name, null: false
      t.date :crimed_at

      t.timestamps null: false
    end
  end
end
