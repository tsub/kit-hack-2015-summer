class AddFaceTypeIdToModel < ActiveRecord::Migration
  def change
    add_reference :face_selections, :face_type, index: true, foreign_key: true, null: false
    add_reference :preference_faces, :face_type, index: true, foreign_key: true, null: false
  end
end
