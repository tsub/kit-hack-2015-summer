class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :sender_id, index: true, foreign_key: true, null: false
      t.integer :receiver_id, index: true, foreign_key: true, null: false
      t.string :message

      t.timestamps null: false
    end
  end
end
