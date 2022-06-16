class LibrariesController < ApplicationController
  before_action :set_library, only: %i[ show edit update destroy ]
  swagger_controller :libraries, 'Libraries'
  # GET /libraries or /libraries.json
  swagger_api :index do
    summary 'Returns all Libraries'
    notes 'Notes...'
  end
  def index
    @libraries = Library.all
  end

  # GET /libraries/1 or /libraries/1.json
  swagger_api :show do
    summary 'Return one Library'
    param :path, :id, :integer, :required, "Library id"
    notes 'Notes...'
  end
  def show
    @user = User.new
  end

  # GET /libraries/new
  def new
    @library = Library.new
    @library.users.build
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries or /libraries.json
  swagger_api :create do
    summary 'Create new library'
    param :form, "library[name]", :string, :required, "Library name"
    param :form, "library[department]", :string, :required, "department of library"
    notes 'Notes...'
  end
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to :controller => "users", :action => "new", :library_id => @library.id, :admin => true, notice: "Library was successfully created." }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  swagger_api :update do
    summary 'Update library'
    param :path, :id, :integer, :required, "Library id"
    param :form, "library[name]", :string, :required, "Library name"
    param :form, "library[department]", :string, :required, "department of library"
    notes 'Notes...'
  end

  # PATCH/PUT /libraries/1 or /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to library_url(@library), notice: "Library was successfully updated." }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  swagger_api :destroy do
    summary 'Removes library'
    param :path, :id, :integer, :required, "Library id"
    notes 'Notes...'
  end

  # DELETE /libraries/1 or /libraries/1.json
  def destroy
    @library.destroy

    respond_to do |format|
      format.html { redirect_to logout_path, notice: "Library was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:name, :department)
    end
end
