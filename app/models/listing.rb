class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :account
  enum condition: {brand_new: 0, overhaul: 1, repaired: 2, serviceable: 3, inspected: 4, unserviceable: 5}
end
