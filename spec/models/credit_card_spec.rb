require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  context 'when validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:cvv) }
    it { is_expected.to validate_presence_of(:expiration_date) }

    it { is_expected.to allow_values('a' * Constants::CARD_NAME_MAX_LENGTH).for(:name) }
    it { is_expected.to allow_values('6771-8921-2291-6236', '4448-8934-1277-7195').for(:code) }
    it { is_expected.to allow_values('342', '123', '423', '093').for(:cvv) }
    it { is_expected.to allow_values('12/42', '01/23', '07/22', '08/99').for(:expiration_date) }
  end

  context 'when not validations' do
    it { is_expected.not_to allow_values(nil, 'a' * Constants::CARD_NAME_MAX_LENGTH.next).for(:name) }
    it { is_expected.not_to allow_values(nil, '3018--dwq12348979-1853').for(:code) }
    it { is_expected.not_to allow_values(nil, '1234', 'eqwr').for(:cvv) }
    it { is_expected.not_to allow_values(nil, '14/32', '00/217').for(:expiration_date) }
  end

  context 'when associations' do
    it { is_expected.to belong_to(:user) }
  end
end
