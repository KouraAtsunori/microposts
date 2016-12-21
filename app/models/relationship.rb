class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  #追加記述20161218
  validates:follower_id,presence:true
  validates:followed_id,presence:true
end
