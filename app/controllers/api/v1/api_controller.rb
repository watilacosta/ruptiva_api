module Api
  module V1
    class ApiController < ApplicationController
      after_action :verify_authorized

      before_action :authenticate_api_v1_user!
    end
  end
end