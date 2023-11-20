# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasketProduct, type: :model do
  describe 'Validations' do
    subject { build(:basket_product) }

    context '#product' do
      it { is_expected.to validate_presence_of(:product) }
      it { is_expected.to validate_uniqueness_of(:product) }
    end
    context '#quantity' do
      it { is_expected.to validate_presence_of(:quantity) }
      it { is_expected.to validate_numericality_of(:quantity) }
    end
  end

  describe 'Associations' do
    subject { build(:basket_product) }

    it { is_expected.to belong_to(:product) }
  end

  describe 'Methods' do
    context '#calculate_price' do
      subject { basket_product.calculate_price }

      let(:basket_product) { create(:basket_product) }

      shared_examples 'correct price' do
        it { is_expected.to eq(price) }
      end

      context 'with promotion' do
        let(:promotion) { double('Promotion') }

        before do
          allow(basket_product.product).to receive(:product_promotion).and_return(promotion)
        end

        context 'applying promotion' do
          let(:price) { Faker::Number.number }

          before do
            allow(promotion).to receive(:apply_promotion).and_return(price)
          end

          include_examples 'correct price'
        end

        context 'whithout applying promotion' do
          let(:price) { basket_product.product.price * basket_product.quantity }

          before do
            allow(promotion).to receive(:apply_promotion).and_return(nil)
          end

          include_examples 'correct price'
        end
      end

      context 'whithout promotion' do
        let(:price) { basket_product.product.price * basket_product.quantity }

        before do
          allow(basket_product.product).to receive(:product_promotion).and_return(nil)
        end

        include_examples 'correct price'
      end
    end
  end
end
