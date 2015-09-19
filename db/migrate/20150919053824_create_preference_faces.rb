class CreatePreferenceFaces < ActiveRecord::Migration
  def change
    create_table :preference_faces do |t|
      t.timestamps null: false
    end
  end
end
