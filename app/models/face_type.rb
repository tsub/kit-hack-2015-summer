class FaceType < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :face_selections, dependent: :destroy
  has_many :preference_faces, dependent: :destroy
end
