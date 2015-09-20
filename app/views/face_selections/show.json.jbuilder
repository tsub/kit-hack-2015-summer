json.array!(@face_selections) do |face|
  json.extract! face, :file_name, :face_type_id
end