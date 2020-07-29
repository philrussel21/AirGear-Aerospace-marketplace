class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :account
  enum condition: {brand_new: 0, overhaul: 1, repaired: 2, serviceable: 3, inspected: 4, unserviceable: 5}

  validates :selling_price, presence: true,
                            format: { without: /\A[a-zA-Z]+\z/, message: "Only Allows Numerical Values"}
  validates :part_num, presence: true
  validates :part_name, presence: true
  validates :condition, presence: true
  validates :quantity, presence: true
  validates :description, presence: true
end
