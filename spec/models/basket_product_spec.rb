# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasketProduct, type: :model do
  subject { build(:basket_product) }

  describe 'Validations' do
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
    it { is_expected.to belong_to(:product) }
  end
end
