class Profile < ApplicationRecord
  belongs_to :account
  has_one_attached :picture
  validates :country, :street, :suburb, :state, :postcode, :contact, presence: true


  # convertes country code to country name when storing to db
  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
