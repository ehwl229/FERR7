class Review < ActiveRecord::Base
  attr_accessible :book_id, :content, :user_id, :user, :book



  belongs_to :user
  belongs_to :book


end

