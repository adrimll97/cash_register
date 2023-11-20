# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Products creation
Product.create(code: 'GR1', name: 'Green Tea', price: 3.11)
Product.create(code: 'SR1', name: 'Strawberries', price: 5.0)
Product.create(code: 'CF1', name: 'Coffee', price: 11.23)

# Promotions
FreePromotion.create(bougths_products: 1, free_products: 1)
PricePromotion.create(min_product_quantity: 3, product_discount: '0.9')
PricePromotion.create(min_product_quantity: 3, product_discount: '2/3')

# ProductPromotions
ProductPromotion.create(product: Product.first, promotionable: FreePromotion.first)
ProductPromotion.create(product: Product.second, promotionable: PricePromotion.first)
ProductPromotion.create(product: Product.last, promotionable: PricePromotion.last)
