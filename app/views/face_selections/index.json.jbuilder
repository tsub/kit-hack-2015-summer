json.array!(@face_selections) do |face|
  json.extract! face, :avatar, :face_type_id
end