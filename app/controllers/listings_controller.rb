class ListingsController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show, :search]
  before_action :set_categories, :set_conditions, :set_currencies, only: [:new, :edit, :show]
  before_action :set_listing, only: [:show]
  before_action :set_account_listing, only: [:edit, :update, :destroy]

  # GET /listings
  def index
    # queries for all listings including its associated category, account, account profile & 
    # attached pictures to be made availabe to listings index.
    # pagy for pagination gem to automate limit() & offset(), limiting to 12 listings per page
    @pagy, @listings = pagy(Listing.includes(:category, account: :profile).all.with_attached_pictures.order("created_at DESC"), items: 12)

    # below works but returns more query lines than above
    # @pagy, @listings = pagy(Listing.includes(:category, :account).all.with_attached_pictures.order("created_at DESC"), items: 12)

  end

  def search
    # queries the db according to chosen category (part_name or part_num) and returns matching results.
    @pagy, @listings = pagy(Listing.includes(:category, account: :profile).all.with_attached_pictures.where("#{params[:search_by]} LIKE ?", "%" + params[:q] + "%"), items: 12)
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    # Sets default values when rendering the new form
    @listing = Listing.new(serial_num: "N/A", form_cert: "N/A")
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = current_account.listings.new(listing_params)
      if @listing.save
        redirect_to @listing, notice: 'Listing was successfully created.'
      else
        set_categories
        set_conditions
        set_currencies
        render :new
      end
  end

  # PATCH/PUT /listings/1
  def update
      if @listing.update(listing_params)
        redirect_to @listing, notice: 'Listing was successfully updated.'
      else
        set_categories
        set_conditions
        set_currencies
        render :edit
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
      params.require(:listing).permit(:category_id, :account_id, :part_num, :part_name, :selling_price, :currency, :serial_num, :condition, :form_cert, :cert_date, :expiry_date, :quantity, :description, pictures: [])
    end

    # authorise only the user who has created the listing to edit or delete it
    def set_account_listing
      id = params[:id]
      @listing = current_account.listings.find_by_id(id)
      if @listing == nil
        redirect_to listings_path, alert: "Access Denied: Unauthorized User"
      end
    end

    def set_categories
      # grabs every category to be used for creating and updating listings
      @categories = Category.all
    end

    def set_conditions
      # grabs every condition to be used for creating and updating listings
      @conditions = Listing.conditions.keys
    end

    def set_currencies
      # grabs every currency from Module to be used for creating and updating listings
      all_currencies = ISO4217::Currency.currencies
      @currencies = all_currencies.map(&:first)
    end

end
