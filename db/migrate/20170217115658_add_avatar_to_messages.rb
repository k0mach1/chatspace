class AddAvatarToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :avatar, :string
  end

  def down
    remove_column :messages, :avatar
  end
end
