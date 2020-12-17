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
FactoryBot.define do
  password  = Faker::Internet.password

  factory :user do
    email                 { Faker::Internet.email(domain: 'ruptiva') }
    password              { password }
    password_confirmation { password }
    first_name            { Faker::Name.name }
    last_name             { Faker::Name.name }

    trait :admin do
      role { :admin }
    end

    trait :user do
      role { :user }
    end

    factory :user_admin, traits: %i[admin]
    factory :user_user, traits: %i[user]
  end
end
