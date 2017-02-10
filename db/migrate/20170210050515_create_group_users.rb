class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
