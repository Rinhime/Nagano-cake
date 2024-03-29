# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 
 
 def after_sign_in_path_for(resource)
  public_root_path
 end
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
   # def new
   #   super
   # end

  # POST /resource/sign_in
   # def create
   #   super
   # end

  # DELETE /resource/sign_out
   # def destroy
   #   super
   # end

   protected
   
   def customer_state
     @customer = Customer.find_by(email: params[:customer][:email])
     return if !@customer
     if @customer.valid_password?(params[:customer][:password])
       if @customer.is_deleted == true
         redirect_to new_customer_session_path
       else
        return
       end
     end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
