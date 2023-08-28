class AddAdditionalColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile, :text unless column_exists?(:users, :profile)
    add_column :users, :occupation, :string unless column_exists?(:users, :occupation)
    add_column :users, :position, :string unless column_exists?(:users, :position)
  end
end


