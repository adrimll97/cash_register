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
end
