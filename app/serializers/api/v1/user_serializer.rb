module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :role

      link(:self) { api_v1_user_url(object.id) }
     end
  end
end
