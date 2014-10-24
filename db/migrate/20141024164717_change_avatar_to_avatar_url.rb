class ChangeAvatarToAvatarUrl < ActiveRecord::Migration
  def change
    rename_column :users, :avatar, :avatar_url
  end
end
