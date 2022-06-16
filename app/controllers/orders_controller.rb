class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  swagger_controller :orders, 'Orders'

  # GET /orders or /orders.json
  swagger_api :index do
    summary 'Return all Orders'
    notes 'Notes...'
  end
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  swagger_api :show do
    summary 'Return specific Order'
    param :path, :id, :integer, :required, "Order ID"
    notes 'Notes...'
  end
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  swagger_api :update do
    summary 'Edit specific Order'
    param :path, :id, :integer, :required, "Order ID"
    param :form, "order[order_date]", :date, :required, "Order date"
    param :form, "order[return_date]", :date, :required, "Return date"
    param :form, "order[user_id]", :date, :required, "User ID"
    notes 'Notes...'
  end
  def edit
  end

  # POST /orders or /orders.json
  swagger_api :create do
    summary 'Create new order'
    param :form, "order[order_date]", :date, :required, "Order date"
    param :form, "order[return_date]", :date, :required, "Return date"
    param :form, "order[user_id]", :date, :required, "User ID"
    notes 'Notes...'
  end
  def create
    @order = Order.new(order_params)
    p order_params

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  swagger_api :destroy do
    summary 'Delete specific Order'
    param :path, :id, :integer, :required, "Order ID"
    notes 'Notes...'
  end
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_date, :return_date, :user_id)
    end
end
