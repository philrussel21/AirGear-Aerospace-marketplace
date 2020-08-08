class CategoriesController < ApplicationController

  def show
    # show for category filter feature. Finds & returns all listings under chosen category 
    # accompanied by its account owner, account profile & listing pictures.
    @category = Category.includes(:listings).find_by(name: params[:name])
    @pagy, @listings = pagy(@category.listings.includes(account: :profile).all.with_attached_pictures, items: 12)

    # below works but queries more than above
    # @category = Category.includes(listings: {account: :profile}).find_by(name: params[:name])
    # @pagy, @listings = pagy(@category.listings.with_attached_pictures, items: 12)
  end
end