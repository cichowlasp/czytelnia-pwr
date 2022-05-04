class SubscryptionsController < ApplicationController
  before_action :set_subscryption, only: %i[ show edit update destroy ]

  # GET /subscryptions or /subscryptions.json
  def index
    @subscryptions = Subscryption.all
  end

  # GET /subscryptions/1 or /subscryptions/1.json
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
