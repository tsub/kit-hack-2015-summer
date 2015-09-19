class CreateEducationalBackgrounds < ActiveRecord::Migration
  def change
    create_table :educational_backgrounds do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :school_name, null: false
      t.date :joined_at
      t.date :quited_at

      t.timestamps null: false
    end
  end
end
