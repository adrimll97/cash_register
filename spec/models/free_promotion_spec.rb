# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FreePromotion, type: :model do
  subject { build(:free_promotion) }

  describe 'Validations' do
    context '#bougths_products' do
      it { is_expected.to validate_presence_of(:bougths_products) }
      it { is_expected.to validate_numericality_of(:bougths_products) }
    end
    context '#free_products' do
      it { is_expected.to validate_presence_of(:free_products) }
      it { is_expected.to validate_numericality_of(:free_products) }
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:product_promotions) }
  end

  describe 'Methods' do
    context '#can_apply_promotion?' do
      subject(:can_apply?) { free_promotion.send(:can_apply_promotion?, nil, quantity) }

      let(:free_promotion) { create(:free_promotion) }

      context 'when quantity is greater than bougths_products' do
        let(:quantity) { free_promotion.bougths_products + 1 }

        it 'return true' do
          expect(can_apply?).to be_truthy
        end
      end

      context 'when quantity is less than bougths_products' do
        let(:quantity) { free_promotion.bougths_products - 1 }

        it 'return false' do
          expect(can_apply?).to be_falsey
        end
      end
    end

    context '#apply_promotion' do
      subject(:apply) { free_promotion.apply_promotion(product, quantity) }

      let(:free_promotion) { create(:free_promotion) }
      let(:quantity) { free_promotion.bougths_products + 1 }
      let(:product) { create(:product) }

      context 'when can apply promotion' do
        let(:bougths_products) { free_promotion.bougths_products }
        let(:free_products) { free_promotion.free_products }
        let(:quantity_to_pay) { ((quantity.to_f / (bougths_products + free_products)) * bougths_products).ceil }
        let(:final_price) { product.price * quantity_to_pay }

        before do
          allow(free_promotion).to receive(:can_apply_promotion?).and_return(true)
        end

        it 'return the price with promotion applied' do
          expect(apply).to eq(final_price)
        end
      end

      context 'when can not apply promotion' do
        before do
          allow(free_promotion).to receive(:can_apply_promotion?).and_return(false)
        end

        it 'return nil' do
          expect(apply).to be_nil
        end
      end
    end
  end
end
