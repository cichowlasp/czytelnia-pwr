class SubscryptionsController < ApplicationController
  before_action :set_subscryption, only: %i[ show edit update destroy ]
  swagger_controller :subscryptions, 'Subscryptions'

  # GET /subscryptions or /subscryptions.json
  swagger_api :index do
    summary 'Returns all Subscryptions'
    notes 'Notes...'
  end
  def index
    @subscryptions = Subscryption.all
  end

  # GET /subscryptions/1 or /subscryptions/1.json
  swagger_api :show do
    summary 'Returns specific Subscryptions'
    param :path, :id, :integer, :required, "Subscryption ID"
    notes 'Notes...'
  end
  def show
  end

  # GET /subscryptions/new
  
  def new
    @subscryption = Subscryption.new
  end

  # GET /subscryptions/1/edit
  def edit
  end

  # POST /subscryptions or /subscryptions.json
  swagger_api :create do
    summary 'Returns specific Subscryptions'
    param :form, "subscryption[price]", :string, :required, "Subscryption price"
    param :form, "subscryption[level]", :string, :required, "Subscryption levels"
    param :form, "subscryption[library_id]", :string, :required, "Library ID"
    notes 'Notes...'
  end
  def create
    @subscryption = Subscryption.new(subscryption_params)

    respond_to do |format|
      if @subscryption.save
        format.html { redirect_to subscryption_url(@subscryption), notice: "Subscryption was successfully created." }
        format.json { render :show, status: :created, location: @subscryption }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscryption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscryptions/1 or /subscryptions/1.json
  swagger_api :update do
    summary 'Update specific Subscryptions'
    param :path, :id, :integer, :required, "Subscryption ID"
    param :form, "subscryption[price]", :string, :required, "Subscryption price"
    param :form, "subscryption[level]", :string, :required, "Subscryption levels"
    param :form, "subscryption[library_id]", :string, :required, "Library ID"
    notes 'Notes...'
  end
  def update
    respond_to do |format|
      if @subscryption.update(subscryption_params)
        format.html { redirect_to subscryption_url(@subscryption), notice: "Subscryption was successfully updated." }
        format.json { render :show, status: :ok, location: @subscryption }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscryption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscryptions/1 or /subscryptions/1.json
  swagger_api :destroy do
    summary 'Remove specific Subscryptions'
    param :path, :id, :integer, :required, "Subscryption ID"
    notes 'Notes...'
  end
  def destroy
    @subscryption.destroy

    respond_to do |format|
      format.html { redirect_to subscryptions_url, notice: "Subscryption was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscryption
      @subscryption = Subscryption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscryption_params
      params.require(:subscryption).permit(:price, :level, :library_id)
    end
end
