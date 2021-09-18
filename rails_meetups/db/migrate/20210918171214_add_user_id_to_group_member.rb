class AddUserIdToGroupMember < ActiveRecord::Migration[6.1]
  def change
    add_column :group_members, :user_id, :integer
    add_index :group_members, :user_id
  end
end
