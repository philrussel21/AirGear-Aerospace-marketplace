class ProfilesController < ApplicationController
  before_action :authenticate_account!, only: [:show]
  before_action :set_profile, only: [:show]
  before_action :set_account_profile, only: [:edit, :update, :destroy]

  # GET /profiles
  #FUTURE - for admin
  def index
    @profiles = Profile.all
  end

  def show
    # query returns all listing of current profile accompanied by its category and attached pictures limited to 12 listings each time.
    @pagy, @listings = pagy(@profile.account.listings.includes(:category).with_attached_pictures, items: 12)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    @profile.account = current_account

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:country, :street, :suburb, :state, :postcode, :website, :contact, :picture)
    end

    # authorise only the user who has created the listing to edit or delete it
    def set_account_profile
      id = params[:id]
      @profile = Profile.find(id)
      if !account_signed_in? || @profile != current_account.profile
        redirect_to profile_path, alert: "Access Denied: Unauthorized User"
      end
    end
end
