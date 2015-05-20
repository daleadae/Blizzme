class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def bnet
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "bnet") if is_navigational_format?
    else
      session["devise.bnet_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
end