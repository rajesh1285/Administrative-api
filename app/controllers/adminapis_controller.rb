class AdminapisController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]

  def register
    @admin = Adminapi.create(admin_params)
   if @admin.save
    response = { message: 'AdminUser created successfully'}
    render json: response, status: :created
   else
    render json: @admin.errors, status: :bad
   end
  end

  def login
    authenticate params[:email], params[:password]
  end

  def test
    render json: {
          message: 'You have passed authentication and authorization test'
        }
  end
  private
  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end

  def admin_params
    params.permit(:username,:email,:password)
  end
end
