class Book < ActiveRecord::Base
  attr_accessible :author, :title
  has_many :reviews
end
