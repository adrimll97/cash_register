# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PricePromotion, type: :model do
  subject { build(:price_promotion) }

  describe 'Validations' do
    context '#min_product_quantity' do
      it { is_expected.to validate_presence_of(:min_product_quantity) }
      it { is_expected.to validate_numericality_of(:min_product_quantity) }
    end
    context '#product_price' do
      it { is_expected.to validate_presence_of(:product_price) }
      it { is_expected.to validate_numericality_of(:product_price) }
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:product_promotions) }
  end
end
