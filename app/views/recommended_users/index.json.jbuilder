count = 0
json.array!(@recommended_users) do |user|
  json.extract! user, :id, :name, :avatar
  json.last_educational_background @last_educational_background[count][0].school_name
  json.last_work_experience @last_work_experience[count][0].company_name
  count+= 1
end
