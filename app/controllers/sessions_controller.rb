class SessionsController < ApplicationController
  swagger_controller :session, "Authentication"
  def new
  end
  swagger_api :create do
    summary "Gather a token"
    param :form, "session[index]", :string, :required, "User index"
    param :form, "session[password]", :string, :required, "User password"
  end
  def create
    respond_to do |format|
      user = User.find_by(index: params[:session][:index])
      if user && user.authenticate(params[:session][:password])
        format.html {
          log_in user
          redirect_to user
        }
        format.json {
          user.password = params[:session][:password]
          user.regenerate_token
          render json: { token: user.token }
        }
      else
        format.html {
          render 'new'
        }
        format.json {
          render json: { message: 'Niepoprawne dane' }
        }
      end
    end
  end
  swagger_api :destroy do
    param :form, :id, :integer, :required, "User id"
    summary "destroy token"
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
