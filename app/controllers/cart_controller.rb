class CartController < ApplicationController
  def show
    @cart = session[:cart] || {}
  end

  def add
    product = Product.find(params[:product_id])
    session[:cart] ||= {}
    session[:cart][product.id] = (session[:cart][product.id] || 0) + 1
    redirect_to product_path(product), notice: "Product added to cart."
  end

  def decrease_quantity
    product = Product.find(params[:product_id])
    decrement_quantity(product)
    redirect_to cart_path, notice: "Quantity decreased."
  end

  def increase_quantity
    product = Product.find(params[:product_id])
    increment_quantity(product)
    redirect_to cart_path, notice: "Quantity increased."
  end

  def remove
    product = Product.find(params[:product_id])
    session[:cart].delete(product.id)
    redirect_to cart_path, notice: "Product removed from cart."
  end

  private

  def decrement_quantity(product)
    return unless cart_item_present?(product) && cart_item_quantity_positive?(product)

    session[:cart][product.id] -= 1
  end

  def increment_quantity(product)
    session[:cart][product.id] ||= 0
    session[:cart][product.id] = calculate_new_quantity(product)
  end

  def calculate_new_quantity(product)
    current_quantity = session[:cart][product.id]
    new_quantity = current_quantity + 1
    session[:cart][product.id] = new_quantity
    new_quantity
  end

  def remove_from_cart(product)
    session[:cart].delete(product.id)
  end

  def cart_item_present?(product)
    session[:cart][product.id].present?
  end

  def cart_item_quantity_positive?(product)
    session[:cart][product.id].positive?
  end
end
