class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name, null: false, length: 30
      t.string  :last_name, null: false, length: 30
      t.string	:user_name, null:false, unique: true, length: 25
      t.string	:password_digest, null: false
      t.string	:email, null: false, unique: true
      t.integer	:age, inclusion: 18..99
      t.text		:bio, length: 600

      t.timestamps null: false
    end
  end
end
