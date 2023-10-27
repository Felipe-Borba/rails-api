class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show update ]
  skip_before_action :validate_admin

  # GET /profiles
  # def index
  #   @profiles = Profile.all
  #
  #   render json: @profiles
  # end

  # GET /profile
  def show
    render json: @profile
  end

  # POST /profile
  def create
    # @profile = Profile.new(profile_params)
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profile
  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = current_user.profile
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:weight, :height, :address, :info)
  end
end
