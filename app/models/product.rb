# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(, )
#  quantity    :integer
#  description :text
#  brand       :string
#  rating      :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category

  has_attached_file :image, 
  :styles => { 
  	:medium => "300x300#", 
  	:thumb => "100x100#" }, 
  :default_url => "missing_product_:style.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
