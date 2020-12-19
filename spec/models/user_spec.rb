# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  first_name             :string
#  last_name              :string
#  email                  :string
#  role                   :integer
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should define_enum_for(:role).with_values(%i[user admin]) }

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:role) }

    it { should validate_presence_of(:password) }
  end

  describe 'Create User' do
    it 'when ROLE :admin' do
      user = create(:user_admin)

      expect(user.admin?).to be_truthy
    end

    it 'when ROLE :user' do
      user = create(:common_user)

      expect(user.user?).to be_truthy
    end
  end
end
