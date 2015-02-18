def is_owner?(user, video)
  user.id == video.user_id
end
