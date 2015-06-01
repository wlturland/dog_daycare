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

validates :name, :owner_id, :breed_id, presence: true


has_attached_file :avatar, :styles => {
      :medium => "300x300#",
      :thumb => "100x100#"
    },
    :default_url => "missing_dog_:style.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
validates_attachment_size :avatar, :less_than => 3.megabytes,
    :unless => Proc.new {|m| m[:avatar_file_name].blank?}

end
