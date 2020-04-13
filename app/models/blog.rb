class Blog < ApplicationRecord
  
  belongs_to :user
  has_many :likes
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
end
