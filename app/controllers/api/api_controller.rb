module Api
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    include Wor::Paginate
    before_action :authenticate_user!
  end
end
