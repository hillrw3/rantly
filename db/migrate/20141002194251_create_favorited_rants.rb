class CreateFavoritedRants < ActiveRecord::Migration
  def change
    create_table :favorited_rants do |t|
      t.integer :rant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
