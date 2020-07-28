json.extract! profile, :id, :country, :street, :suburb, :state, :postcode, :website, :contact, :created_at, :updated_at
json.url profile_url(profile, format: :json)
