class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.string :my_number, null: false, default: ""
      t.string :name, null: false
      t.date :birthdate, null: false
      t.string :address, null: false
      t.string :hobby
      t.integer :gender, null: false
      t.string :avatar, null: false
      t.references :face_type, index: true, foreign_key: true, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end