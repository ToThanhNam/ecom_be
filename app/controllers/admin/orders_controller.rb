class Admin::OrdersController < AdminController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @fullfilled_orders = Order.where(fullfilled: true).order(created_at: :asc)
    @pending_orders = Order.where(fullfilled: false).order(created_at: :asc)
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to admin_orders_path, notice: "Oders was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to [ :admin, @order ], notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_products_url, notice: "Order was successfully destroyed."
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_email, :fullfilled, :total, :address)
  end
end
