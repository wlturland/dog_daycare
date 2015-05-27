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

	validates :first_name, :last_name, :phone, presence: true

end
