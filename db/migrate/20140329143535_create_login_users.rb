class CreateLoginUsers < ActiveRecord::Migration
  def change
    create_table :login_users do |t|
      t.string :user_name , null:false
      t.string :password , null:false
      t.timestamps
    end
  end
end
