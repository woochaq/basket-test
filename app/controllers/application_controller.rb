class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :initialize_basket

  protected

    def after_sign_in_path_for(resource_or_scope)
      products_path
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    def initialize_basket
      @basket = InitializeBasketService.new(current_user).call if user_signed_in?
    end
end
