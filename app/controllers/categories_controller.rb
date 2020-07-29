class CategoriesController < ApplicationController

  def show
    @category = Category.includes(listings: :account).find_by(name: params[:name])
  end
end