class RemoveRantIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :rant_id, :integer
  end
end
