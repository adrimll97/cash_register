# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Baskets', type: :request do
  shared_examples 'redirect' do
    it 'redirect_to root_path' do
      expect redirect_to(:root)
    end
  end

  describe 'GET /index' do
    subject(:make_get) { get '/baskets/index' }

    let(:basket_products) { create_list(:basket_product, 3) }

    before do
      make_get
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'get all products' do
      all_products = assigns(:products)
      expect(all_products.size).to eq(Product.count)
    end

    it 'get all basket products' do
      all_basket_products = assigns(:basket_products)
      expect(all_basket_products.size).to eq(BasketProduct.count)
    end
  end

  describe 'GET /add_product' do
    subject(:make_post) { post '/baskets/add_product', params: { product_id: product.id } }

    let(:product) { create(:product) }

    context 'whithout basket product' do
      before do
        make_post
      end

      it 'create a new basket_product' do
        aggregate_failures do
          expect(BasketProduct.count).to eq(1)
          expect(BasketProduct.pick(:quantity)).to eq(1)
        end
      end

      include_examples 'redirect'
    end

    context 'whith existing basket product' do
      let!(:basket_product) { create(:basket_product, product: product) }

      before do
        make_post
      end

      it 'update basket_product increasing the quantity' do
        aggregate_failures do
          expect(BasketProduct.count).to eq(1)
          expect(BasketProduct.pick(:quantity)).to eq(basket_product.quantity + 1)
        end
      end

      include_examples 'redirect'
    end
  end

  describe 'GET /remove_product' do
    subject(:make_post) { post '/baskets/remove_product', params: { basket_product_id: basket_product.id } }

    context 'removing last product' do
      let!(:basket_product) { create(:basket_product, quantity: 1) }

      before do
        make_post
      end

      it 'destroy basket_product' do
        expect(BasketProduct.count).to be_zero
      end

      include_examples 'redirect'
    end

    context 'removing product that is not the last' do
      let!(:basket_product) { create(:basket_product) }

      before do
        make_post
      end

      it 'update basket_product reducing the quantity' do
        expect(BasketProduct.pick(:quantity)).to eq(basket_product.quantity - 1)
      end

      include_examples 'redirect'
    end
  end

  describe 'GET /calculate_price' do
    subject(:make_post) { post '/baskets/calculate_price' }

    context 'with basket_products' do
      let!(:basket_product1) { create(:basket_product) }
      let!(:basket_product2) { create(:basket_product) }
      let(:basket_product1_price) { basket_product1.product.price * basket_product1.quantity }
      let(:basket_product2_price) { basket_product2.product.price * basket_product2.quantity }
      let(:final_price) { basket_product1_price + basket_product2_price }

      before do
        allow(basket_product1).to receive(:calculate_price).and_return(basket_product1_price)
        allow(basket_product2).to receive(:calculate_price).and_return(basket_product2_price)
        make_post
      end

      it 'set flash notice with correct price' do
        expect(flash[:notice]).to eq(final_price)
      end

      include_examples 'redirect'
    end

    context 'without basket_products' do
      before do
        make_post
      end

      it 'set flash notice to zero' do
        expect(flash[:notice]).to be_zero
      end

      include_examples 'redirect'
    end
  end
end
