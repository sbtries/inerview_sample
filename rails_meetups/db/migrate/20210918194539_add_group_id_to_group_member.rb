class AddGroupIdToGroupMember < ActiveRecord::Migration[6.1]
  def change
    add_column :group_members, :group_id, :integer
    add_index :group_members, :group_id
  end
end
