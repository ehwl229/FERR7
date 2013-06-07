class Books < ActiveRecord::Base
  attr_accessible :author, :title, :reviews


  has_many :reviews


end