class ChangeRantType < ActiveRecord::Migration
  def change
    change_column :rants, :rant, :text, limit: nil
  end
end
