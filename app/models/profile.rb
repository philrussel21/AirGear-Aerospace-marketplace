class Profile < ApplicationRecord
  belongs_to :account
  has_one_attached :picture

  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
