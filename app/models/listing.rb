class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :account
  has_many_attached :pictures
  enum condition: {brand_new: 0, overhaul: 1, repaired: 2, serviceable: 3, inspected: 4, unserviceable: 5}

  validates :selling_price, presence: true,
                            format: { without: /\A[a-zA-Z]+\z/, message: "Only Allows Numerical Values"}
  validates :part_num, :description, :part_name, :condition, :quantity, presence: true
end
