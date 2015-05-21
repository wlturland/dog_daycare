class Owner < ActiveRecord::Base
	has_many :dogs

	def last_first
		"#{last_name}, #{first_name}" 
	end

end
