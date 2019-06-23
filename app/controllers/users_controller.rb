class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # helper_method :sort_column, :sort_direction

  # GET /user
  def index
    @users = User.all.order("created_at DESC")    # ("#{sort_column} #{sort_direction}")

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {
          message: 'successfully deleted user'
        }
  end


  private

    # def sort_direction
    #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    # end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :address)
    end
end
