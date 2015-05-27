namespace :db do 

	desc "Clear the db and fill with sample data"
	task :populate => :environment do 
		require 'populator'
		require 'faker'

		# clear out data
			# acceptable
		# Owner.destroy_all
		# Dog.destroy_all
			# best practice
		[Owner, Dog].each(&:destroy_all)


		#begin population
		# add Owners
		Owner.populate 30 do |owner|
			owner.first_name = Faker::Name.first_name
			owner.last_name = Faker::Name.last_name
			owner.phone = Faker::PhoneNumber.phone_number
			owner.emerg_name = Faker::Name.name
			owner.emerg_phone =Faker::PhoneNumber.phone_number
		# add Dogs
		Dog.populate 1..5 do |dog|
			breed_id = rand(1..14)
			dog.owner_id = owner.id 
			dog.name = Faker::App.name
			dog.breed_id = breed_id
			dog.dob = Faker::Date.between(3650.days.ago, 42.days.ago)
			dog.vet = Faker::Name.name
			dog.vet_phone =Faker::PhoneNumber.phone_number
			dog.in_daycare = [true, false].sample
		end #dog
		end #population
	end #task
end

# belongs in lib/tasks