class ChangeAvatarUrlToAvatar < ActiveRecord::Migration
  def change
    rename_column :users, :avatar_url, :avatar
  end
end
