# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # before_action :authenticate_user!
  def google_oauth2
    basic_action(:google)
  end

  def facebook
    basic_action(:facebook)
  end

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  
  private
  # Google認証結果を取得
  def basic_action(provider)
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @user = User.where(provider: @omniauth[:provider], uid: @omniauth[:uid]).first
      # アカウントが登録されていなければ登録ページに遷移する
      unless @user
        session[:nickname] = @omniauth['info']['name']
        session[:email]    = @omniauth['info']['email']
        session[:password] = Devise.friendly_token[0, 20]
        session[:provider] = @omniauth['provider']
        session[:uid]      = @omniauth['uid']
        session[:token]    = @omniauth['credentials']['token']
        # session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_path
      else
        sign_in(:user, @user)
        redirect_to root_path
      end
    end
  end
end
