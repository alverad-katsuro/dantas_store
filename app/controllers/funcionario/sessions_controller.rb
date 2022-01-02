# frozen_string_literal: true

class Funcionario::SessionsController < Devise::SessionsController
  before_action :algum_usuario_logado?,  only: [:new, :create]
  #before_action 
  # GET /resource/sign_in
  #def new
  #  super
  #end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def algum_usuario_logado?
    if user_signed_in?
      redirect_to user_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
