class Blog < ApplicationRecord
	 belongs_to :user
	 has_many :likes


	 # ログインしているユーザーがブログをいいねしているがどうか判断するメソッド
	 def liked_by?(user)
	 	# Blog.likesが省略されている
   	likes.where(user_id: user.id).exists?
	 end
end
