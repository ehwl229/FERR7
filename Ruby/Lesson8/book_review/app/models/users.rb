class Users < ActiveRecord::Base
attr_accessible :age, :email, :first_name, :last_name, :reviews

	def is_teen? 
		age > 12 && age < 19 
	end

	def has_long_name? 
		(first_name.length + last_name.length) > 10 
	end

	def self.all_long_name
		self.all.select do |user|
	 		user.has_long_name?
	 	end
	end
 
	has_many :reviews

end




