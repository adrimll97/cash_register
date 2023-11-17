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
end
