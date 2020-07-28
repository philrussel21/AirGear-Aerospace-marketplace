class Profile < ApplicationRecord
  belongs_to :account


  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
