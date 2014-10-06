module ApplicationHelper

  def follow_link(rant)
    if Follower.find_by(user_id: session[:user_id], following: rant.user.id) == nil
      link_to 'Follow', new_follower_path(ranter_id: rant.user.id, ranter_name: rant.user.username)
    else
      link_to 'Unfollow', follower_path(id: rant.user.id), method: :delete
    end
  end

  def favorite_link(rant)
    favorited_rant = FavoritedRant.find_by(user_id: session[:user_id], rant_id: rant.id)
    if favorited_rant == nil
      link_to "Favorite", new_favorited_rant_path(rant_id: rant.id), class: "favorite-link"
    else
      link_to "Unfavorite", favorited_rant_path(id: favorited_rant), method: :delete, class: "favorite-link"
    end
  end


end
