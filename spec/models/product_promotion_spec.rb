# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductPromotion, type: :model do
  subject { build(:product_promotion) }

  describe 'Validations' do
    context '#product' do
      it { is_expected.to validate_presence_of(:product) }
    end
    context '#promotionable' do
      it { is_expected.to validate_presence_of(:promotionable) }
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:promotionable) }
  end

  describe 'Methods' do
    context '#apply_promotion' do
      subject(:promotionable) { product_promotion.promotionable }

      let(:product_promotion) { create(:product_promotion, %i[free price].sample) }
      let(:quantity) { Faker::Number.number }

      after do
        product_promotion.apply_promotion(quantity)
      end

      it 'call apply_promotion of promotionable' do
        expect(promotionable).to receive(:apply_promotion).with(product_promotion.product, quantity)
      end
    end
  end
end
