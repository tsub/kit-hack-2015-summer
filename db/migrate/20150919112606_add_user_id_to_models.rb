class AddUserIdToModels < ActiveRecord::Migration
  def change
    add_reference :educational_backgrounds, :user, index: true, foreign_key: true, null: false
    add_reference :work_experiences, :user, index: true, foreign_key: true, null: false
    add_reference :medical_histories, :user, index: true, foreign_key: true, null: false
    add_reference :crime_histories, :user, index: true, foreign_key: true, null: false
    add_reference :preference_faces, :user, index: true, foreign_key: true, null: false
  end
end
