# == Schema Information
#
# Table name: owners
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  phone       :string
#  emerg_name  :string
#  emerg_phone :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Owner < ActiveRecord::Base
	has_many :dogs

	def last_first
		"#{last_name}, #{first_name}" 
	end

	# validates :first_name, presence: true, length {minimum: 3}
	# validates :last_name, presence: true, length {minimum: 3}   
	# validates :phone, presence: true, length {minimum: 10}       
	# validates :emerg_name, presence: true, length {minimum: 3}  
	# validates :emerg_phone, presence: true, length {minimum: 10} 

end
