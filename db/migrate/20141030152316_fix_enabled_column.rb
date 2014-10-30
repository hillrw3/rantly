class FixEnabledColumn < ActiveRecord::Migration
  def change
    change_column :users, :enabled, :boolean, default: false
  end
end
