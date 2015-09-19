class CreateFaceSelections < ActiveRecord::Migration
  def change
    create_table :face_selections do |t|
      t.string :file_name, null: false
      t.integer :gender, null: false

      t.timestamps null: false
    end
  end
end
