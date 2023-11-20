# frozen_string_literal: true

Rails.application.routes.draw do
  root 'baskets#index'

  get 'baskets/index'
  post 'baskets/calculate_price'
  post 'baskets/add_product'
  post 'baskets/remove_product'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
