class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  
  swagger_controller :books, 'Books'
  # GET /books or /books.json
  swagger_api :index do
    summary 'Return all books'
    notes 'Notes...'
  end
  def index
    @books = Book.all
  end
  swagger_api :show do
    summary 'Return specific book'
    param :path, :id, :integer, :required, "Book ID"
    notes 'Notes...'
  end
  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  swagger_api :update do
    summary 'Edit specific book'
    param :path, :id, :integer, :required, "Book ID"
    param :form, "book[title]", :string, :required, "Book title"
    param :form, "book[author]", :string, :required, "Book author"
    param :form, "book[publisher]", :string, :required, "Book publisher"
    param :form, "book[available]", :boolean, :required, "Book available"
    param :form, "book[library_id]", :string, :required, "Book library"
    param :form, "book[order_id]", :string, :optional, "Book order_id"
    notes 'Notes...'
  end
  def edit
  end

  # POST /books or /books.json
  swagger_api :create do
    summary 'Create book'
    param :form, "book[title]", :string, :required, "Book title"
    param :form, "book[author]", :string, :required, "Book author"
    param :form, "book[publisher]", :string, :required, "Book publisher"
    param :form, "book[available]", :boolean, :required, "Book available"
    param :form, "book[library_id]", :string, :required, "Book library"
    param :form, "book[order_id]", :string, :optional, "Book order_id"
    notes 'Notes...'
  end
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  swagger_api :destroy do
    summary 'Delete specific book'
    param :path, :id, :integer, :required, "Book ID"
    notes 'Notes...'
  end
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :type, :publisher, :available, :order_id, :library_id)
    end
end
