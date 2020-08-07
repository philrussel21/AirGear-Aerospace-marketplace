class Profile < ApplicationRecord
  belongs_to :account
  has_one_attached :picture
  validates :country, :street, :suburb, :state, :postcode, :contact, presence: true

  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
