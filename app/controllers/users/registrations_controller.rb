# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    ActiveRecord::Base.transaction do
      @user = User.new(nickname: params[:nickname])
      @user.save!
      @user_database_authentication = \
        UserDatabaseAuthentication.new( \
          user: @user, \
          email: params[:user_database_authentication][:email], \
          password: params[:user_database_authentication][:password], \
          password_confirmation: params[:user_database_authentication][:password_confirmation])
      @user_database_authentication.save!
    end

    sign_in(:user, @user)
    sign_in(:database_authentication, @user_database_authentication)

    redirect_to root_path
  rescue
    flash[:alert] = '処理に失敗しました。もう一度お試しください。'
    return render :new
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
