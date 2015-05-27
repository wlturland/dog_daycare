class Dog < ActiveRecord::Base
  belongs_to :owner
  belongs_to :breed

validates :name, :owner_id, :breed_id, presence: true
  
end
