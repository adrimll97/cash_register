# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) }

  describe 'Validations' do
    context '#code' do
      it { is_expected.to validate_presence_of(:code) }
      it { is_expected.to validate_uniqueness_of(:code) }
    end
    context '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end
    context '#price' do
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_numericality_of(:price) }
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:basket_products) }
    it { is_expected.to have_many(:promotions) }
  end
end
