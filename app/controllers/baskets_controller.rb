# frozen_string_literal: true

class BasketsController < ApplicationController
  def index
    @products = Product.all
    @basket_products = BasketProduct.all
  end

  def add_product
    basket_product = BasketProduct.find_or_create_by(product_id: params[:product_id])
    old_quantity = basket_product.quantity || 0
    basket_product.update(quantity: old_quantity + 1)

    redirect_to root_path
  end

  def remove_product
    basket_product = BasketProduct.find(params[:basket_product_id])
    quantity = basket_product.quantity - 1
    quantity.zero? ? basket_product.destroy : basket_product.update(quantity: quantity)

    redirect_to root_path
  end

  def calculate_price
    price = 0

    BasketProduct.find_each do |basket_product|
      basket_product_price = basket_product.calculate_price
      price += basket_product_price
    end

    flash[:notice] = price
    redirect_to root_path
  end
end
