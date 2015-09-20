class RecommendedUsersController < ApplicationController
  def index
    token_check
    preference_types =[]
    @last_educational_background = []
    @last_work_experience = []

    @current_user.face_types.each do |preference_type|
      preference_types.push(preference_type)
    end

    @recommended_users = User.includes(:face_type).where(gender: @current_user.gender ^ 1).where(face_types: { id: preference_types })
    @recommended_users = @recommended_users.order('rand()').limit(3)

    @recommended_users.each do |user|
      @last_educational_background.push(user.educational_backgrounds.order('quited_at DESC').limit(1))
      @last_work_experience.push(user.work_experiences.order('joined_at DESC').limit(1))
    end
  end
end
