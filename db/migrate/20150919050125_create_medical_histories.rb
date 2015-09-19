class CreateMedicalHistories < ActiveRecord::Migration
  def change
    create_table :medical_histories do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :disease_name, null: false
      t.date :joined_at
      t.date :quited_at

      t.timestamps null: false
    end
  end
end
