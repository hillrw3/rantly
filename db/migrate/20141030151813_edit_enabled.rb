class EditEnabled < ActiveRecord::Migration
  def change
    change_column :users, :enabled, :string, default: false
  end
end
