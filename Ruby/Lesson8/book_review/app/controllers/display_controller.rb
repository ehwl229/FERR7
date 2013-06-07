class DisplayController < ApplicationController
  def display_users
  	@users = Users.all
  end

  def display_reviews
  	@reviews = Review.all
  end

  def display_books
  	@books = Books.all
  end
end
