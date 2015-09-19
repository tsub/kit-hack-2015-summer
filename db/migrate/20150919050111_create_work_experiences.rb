class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :company_name, null: false
      t.date :joined_at
      t.date :quited_at

      t.timestamps null: false
    end
  end
end
