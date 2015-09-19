class User < ActiveRecord::Base
  authenticates_with_sorcery!

  after_initialize :set_my_number

  belongs_to :face_type
  has_many :api_keys, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :educational_backgrounds, dependent: :destroy
  has_many :medical_histories, dependent: :destroy
  has_many :crime_histories, dependent: :destroy
  has_many :preference_faces, dependent: :destroy
  has_many :face_types, through: :preference_faces, dependent: :destroy
  has_many :senders, class_name: 'Request', foreign_key: 'sender_id'
  has_many :receivers, class_name: 'Request', foreign_key: 'receiver_id'


  accepts_nested_attributes_for :work_experiences, :educational_backgrounds, :medical_histories, :crime_histories, :preference_faces, reject_if: :all_blank

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :my_number, uniqueness: true

  def self.login?(access_token)
    api_key = ApiKey.find_by_access_token(access_token)
    return false if !api_key || !api_key.before_expired? || !api_key.active
    return !self.find(api_key.user_id).nil?
  end

  def activate
    if !api_key
      return ApiKey.create(user_id: self.id)
    else
      if !api_key.active
        api_key.set_active
        api_key.save
      end

      if !api_key.before_expired?
        api_key.set_expiration
        api_key.save
      end

      return api_key
    end
  end

  def inactivate
    api_key.active = false
    api_key.save
  end

  private

  def api_key
    @api_key ||= ApiKey.find_by_user_id(self.id)
  end

  def set_my_number
    self.email = self.my_number
    self.password = self.my_number
    self.password_confirmation = self.my_number
  end
end
