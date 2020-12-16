require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class.new(user, user) }
  let(:user) { build(:user_user) }

  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[index show update destroy]) }
  end

  context 'when user is an admin' do
    let(:user) { create(:user_admin) }

    it { is_expected.to  permit_actions(%i[show index destroy create update]) }
  end

  context 'when User is a common user' do
    it { is_expected.to forbid_actions(%i[index update destroy]) }
  end
end
