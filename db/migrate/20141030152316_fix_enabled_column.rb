class FixEnabledColumn < ActiveRecord::Migration
  def change
    change_column :users, :enabled, :boolean, default: false, 'boolean USING CAST(enabled AS boolean)'
  end
end
