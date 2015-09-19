class CreatePreferenceFaces < ActiveRecord::Migration
  def change
    create_table :preference_faces do |t|
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
