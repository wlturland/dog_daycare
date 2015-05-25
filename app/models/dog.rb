# == Schema Information
#
# Table name: dogs
#
#  id                  :integer          not null, primary key
#  name                :string
#  owner_id            :integer
#  breed_id            :integer
#  dob                 :date
#  vet                 :string
#  vet_phone           :string
#  in_daycare          :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Dog < ActiveRecord::Base
  belongs_to :owner
  belongs_to :breed

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 validates :name, presence: true, length: {minimum: 3}
 validates :vet, presence: true, length: {minimum: 3}
 validates :vet_phone, presence: true, length: {minimum: 10}
end
