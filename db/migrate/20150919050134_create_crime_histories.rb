class CreateCrimeHistories < ActiveRecord::Migration
  def change
    create_table :crime_histories do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :crime_name, null: false
      t.date :crimed_at

      t.timestamps null: false
    end
  end
end
