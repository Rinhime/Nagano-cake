class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:top, :about, :index, :show]
  protect_from_forgery with: :exception
  
  helper_method :current_cart
  
  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      admin_customers_path
    end
  end
end
