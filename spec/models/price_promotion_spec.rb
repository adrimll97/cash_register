# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PricePromotion, type: :model do
  subject { build(:price_promotion) }

  describe 'Validations' do
    context '#min_product_quantity' do
      it { is_expected.to validate_presence_of(:min_product_quantity) }
      it { is_expected.to validate_numericality_of(:min_product_quantity) }
    end
    context '#product_discount' do
      it { is_expected.to validate_presence_of(:product_discount) }
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:product_promotions) }
  end

  describe 'Methods' do
    context '#can_apply_promotion?' do
      subject(:can_apply?) { price_promotion.send(:can_apply_promotion?, nil, quantity) }

      let(:price_promotion) { create(:price_promotion) }

      context 'when quantity is greater than min_product_quantity' do
        let(:quantity) { price_promotion.min_product_quantity + 1 }

        it 'return true' do
          expect(can_apply?).to be_truthy
        end
      end

      context 'when quantity is less than min_product_quantity' do
        let(:quantity) { price_promotion.min_product_quantity - 1 }

        it 'return false' do
          expect(can_apply?).to be_falsey
        end
      end
    end

    context '#apply_promotion' do
      subject(:apply) { price_promotion.apply_promotion(product, quantity) }

      let(:price_promotion) { create(:price_promotion) }
      let(:quantity) { price_promotion.min_product_quantity + 1 }
      let(:product) { create(:product) }

      context 'when can apply promotion' do
        let(:promotion_price) { product.price * price_promotion.product_discount.to_r }
        let(:final_price) { promotion_price * quantity }

        before do
          allow(price_promotion).to receive(:can_apply_promotion?).and_return(true)
        end

        it 'return the price with promotion applied' do
          expect(apply).to eq(final_price)
        end
      end

      context 'when can not apply promotion' do
        before do
          allow(price_promotion).to receive(:can_apply_promotion?).and_return(false)
        end

        it 'return nil' do
          expect(apply).to be_nil
        end
      end
    end
  end
end
