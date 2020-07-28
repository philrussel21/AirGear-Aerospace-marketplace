class ListingsController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show]
  before_action :set_categories, :set_conditions, only: [:new, :edit]
  before_action :set_listing, only: [:show]
  before_action :set_account_listing, only: [:edit, :update, :destroy]

  # GET /listings
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = current_account.listings.new(listing_params)
      if @listing.save
        redirect_to @listing
        #notice: 'Listing was successfully created.'
      else
        render :new
        #format.json { render json: @listing.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /listings/1
  def update
      if @listing.update(listing_params)
        redirect_to @listing
          #notice: 'Listing was successfully updated.'
      else
        render :edit
        #@listing.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
      redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:category_id, :account_id, :part_num, :part_name, :selling_price, :currency, :serial_num, :condition, :form_cert, :cert_date, :expiry_date, :quantity, :description)
    end

    # authorise only the user who has created the listing to edit or delete it
    def set_account_listing
      id = params[:id]
      @listing = current_account.listings.find_by_id(id)
      if @listing == nil
        redirect_to listings_path
      end
    end

    def set_categories
      @categories = Category.all
    end

    # TODO - enums
    def set_conditions
      @conditions = Listing.conditions.keys
    end
end
