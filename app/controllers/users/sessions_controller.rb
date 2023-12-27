class Users::SessionsController < Devise::SessionsController
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

  # protected
  def create
    super do |resource|
      return redirect_to new_user_registration_path unless resource.persisted?

      flash[:alert] = 'Invalid email or password'
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end



  protected

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
