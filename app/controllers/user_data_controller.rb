class UserDataController < ApplicationController
  before_action :set_user_datum, only: %i[ show edit update destroy ]
  swagger_controller :user_datum, 'Users Data'
  # GET /user_data or /user_data.json
  swagger_api :index do
    summary 'Returns all Users Data'
    notes 'Notes...'
  end
  def index
    @user_data = UserDatum.all
  end

  # GET /user_data/1 or /user_data/1.json
  swagger_api :show do
    summary 'Returns specific Users Data'
    param :path, :id, :integer, :required, "User data id"
    notes 'Notes...'
  end
  def show
  end

  # GET /user_data/new
  def new
    @user_datum = UserDatum.new
  end
  swagger_api :update do
    summary 'Edit specific Users Data'
    param :path, :id, :integer, :required, "User Data id"
    param :form, "user_datum[name]", :string, :required, "User name"
    param :form, "user_datum[surname]", :string, :required, "User surname"
    param :form, "user_datum[university]", :string, :required, "User university"
    param :form, "user_datum[department]", :string, :required, "User department"
    param :form, "user_datum[field_of_study]", :string, :required, "user field of study"
    param :form, "user_datum[country]", :string, :required, "User country"
    param :form, "user_datum[user_id]", :string, :required, "User id"
    notes 'Notes...'
  end
  # GET /user_data/1/edit
  def edit
  end

  # POST /user_data or /user_data.json
  
  swagger_api :create do
    summary 'Create User Data'
    param :path, :id, :integer, :required, "User id"
    param :form, "user_datum[name]", :string, :required, "User name"
    param :form, "user_datum[surname]", :string, :required, "User surname"
    param :form, "user_datum[university]", :string, :required, "User university"
    param :form, "user_datum[department]", :string, :required, "User department"
    param :form, "user_datum[field_of_study]", :string, :required, "user field of study"
    param :form, "user_datum[country]", :string, :required, "User country"
    param :form, "user_datum[user_id]", :string, :required, "User id"
    notes 'Notes...'
  end
  def create
    @user_datum = UserDatum.new(user_datum_params)

    respond_to do |format|
      if @user_datum.save
        if current_user
          format.html { redirect_to root_path, notice: "User datum was successfully created." }
        else
          format.html { redirect_to login_path, notice: "User datum was successfully created." }
        end
        format.json { render :show, status: :created, location: @user_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_data/1 or /user_data/1.json
  def update
    respond_to do |format|
      if @user_datum.update(user_datum_params)
        format.html { redirect_to user_url(@user_datum.user_id), notice: "User datum was successfully updated." }
        format.json { render :show, status: :ok, location: @user_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_data/1 or /user_data/1.json
  swagger_api :destroy do
    summary 'Delete specific user data'
    param :path, :id, :integer, :required, "User Data id"
    notes 'Notes...'
  end
  def destroy
    @user_datum.destroy

    respond_to do |format|
      format.html { redirect_to user_data_url, notice: "User datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_datum
      @user_datum = UserDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_datum_params
      params.require(:user_datum).permit(:name, :surname, :university, :department, :field_of_study, :country, :user_id)
    end
end
