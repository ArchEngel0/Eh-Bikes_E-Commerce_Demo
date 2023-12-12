class CartController < ApplicationController
  def show
    @cart = session[:cart] || {}
    # puts "Cart: " + @cart.to_s; # debug
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
    remove_from_cart(product)
    redirect_to cart_path, notice: "Product removed from cart."
  end

  private

  def decrement_quantity(product)
    session[:cart][product.id.to_s] -= 1
    session[:cart][product.id.to_s] = 0 if (session[:cart][product.id.to_s]).negative?
  end

  def increment_quantity(product)
    session[:cart] ||= {}
    session[:cart][product.id.to_s] ||= 0
    session[:cart][product.id.to_s] += 1
  end

  def remove_from_cart(product)
    session[:cart].delete(product.id.to_s)
  end
end
