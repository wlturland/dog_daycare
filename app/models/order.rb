class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  validates :name, :address, presence: true
  # validates :user_id, presence: true

  PAYMENT_TYPES = ["Credit Card"]
  validates :pay_type, inclusion: PAYMENT_TYPES

	def subtotal
		line_items.to_a.sum { |item| item.total_price }
	end

  def add_line_items_from_cart(cart)
   cart.line_items.each do |item|
     item.cart_id = nil
     line_items << item
   end
 end
end
