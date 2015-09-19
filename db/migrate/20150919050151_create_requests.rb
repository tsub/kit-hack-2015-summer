class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id, index: true, foreign_key: true, null: false
      t.integer :receiver_id, index: true, foreign_key: true, null: false
      t.string :message
      t.integer :status, null: false, default: 0
      
      t.timestamps null: false
    end
  end
end
