# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, :configure_sign_up_params, only: [:update, :create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_perfil
    respond_with resource
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #  super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up) { |user| user.permit(permitted_attributes) }
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes )
  end


  def permitted_attributes
    [
      :perfil,
      :perfil_attributes,
      perfil_attributes: %i[nome sobrenome rua numero telefone bairro sexo cidade estado complemento aniversario]
    ]
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: permitted_attributes)
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
