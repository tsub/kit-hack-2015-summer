class PreferenceFace < ActiveRecord::Base
  belongs_to :user
  belongs_to :face_type
end
