class Breed < ActiveRecord::Base
	has_many :dogs

	validates :breed, presence: true
end
