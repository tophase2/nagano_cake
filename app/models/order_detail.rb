class OrderDetail < ApplicationRecord
  belongs_to :order
	belongs_to :item
	
	validates :item_id, presence: true
	validates :order_id, presence: true
	validates :price, presence: true
	validates :amount, presence: true
end
