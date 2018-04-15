class OrdersController < ApplicationController
	before_action :authenticate_user!

  def create
  	@product = Product.find(params[:product_id])
  	#@order = Order.new(product: @product, user: current_user)
    @order = Order.find_or_create_by(user: current_user, product: @product, payed: false, price: @product.price)
    @order.quantity += 1

  	if @order.save
  		redirect_to products_path, notice: 'El producto ha sido añadido al carro de compras'
  	else
  		redirect_to products_path, alert: 'El producto no ha sido añadido al carro de compras'
  	end
  end

  def index
  	#@orders = Order.where(user: current_user, payed: false)
    @orders = current_user.orders.cart
    @total = @orders.get_total
  end

  def payed
    @orders = current_user.orders.payed
   #@total = @orders.get_total
    @orders_id = @orders.pluck(:billing_id).uniq!
    
  end

  def clean
    @orders = Order.where(user: current_user, payed: false)
    @orders.destroy_all
    redirect_to orders_path, notice: 'El carro se ha vaciado.'
  end
end
