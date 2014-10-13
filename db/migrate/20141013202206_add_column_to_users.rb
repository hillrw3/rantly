class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ip_id, :integer
  end
end
