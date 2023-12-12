class OrdersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @orders = @user.orders
  end

  def create
    user = current_user
    cart_products = retrieve_cart_products

    process_cart_products(user, cart_products)

    redirect_to user_orders_path(user)
  end

  private

  def process_cart_products(user, cart_products)
    cart_products.each do |product, quantity|
      province = Province.find(user.province_id)
      gst = province.gst || 0
      hst = province.hst || 0
      pst = province.pst || 0
      # total = calculate_total(product, quantity, gst, hst, pst)
      options = { price: product.price, gst:, hst:, pst: }

      create_order(user, product, quantity, options)
    end
  end

  def create_order(user, product, quantity, options = {})
    Order.create(
      user_id:  user.id,
      product:  product.name,
      quantity:,
      price:    options[:price] || 0,
      tax:      calculate_tax(options),
      total:    calculate_total(product, quantity, options)
    )
  end

  def calculate_tax(options)
    price = options[:price]
    gst = options[:gst]
    hst = options[:hst]
    pst = options[:pst]
    price * (gst + hst + pst)
  end

  def calculate_total(_product, quantity, options)
    price = options[:price]
    tax = calculate_tax(options)
    total = price + tax
    quantity * total
  end

  def retrieve_cart_products
    # Retrieve the cart from the session
    cart = session[:cart] || {}

    # Retrieve the products and quantities from the cart
    cart_products = {}
    cart.each do |product_id, quantity|
      product = Product.find(product_id)
      cart_products[product] = quantity
    end

    cart_products
  end
end
