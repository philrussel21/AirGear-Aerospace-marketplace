class CategoriesController < ApplicationController

  def show
    @category = Category.includes(listings: :account).find_by(name: params[:name])
    @pagy, @listings = pagy(@category.listings, items: 12)
  end
end