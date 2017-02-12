class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :group_id, null: false

      t.timestamps null: false
    end
  end
end
