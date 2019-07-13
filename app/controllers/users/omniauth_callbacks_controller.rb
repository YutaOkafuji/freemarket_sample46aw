# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # before_action :authenticate_user!
  def google_oauth2
  basic_action
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
  def basic_action
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @user = User.where(provider: @omniauth[:provider], uid: @omniauth[:uid]).first
      # アカウントが登録されていなければ登録ページに遷移する
      unless @user
        # アカウント情報を作成する
        @user = User.create(
          provider: @omniauth.provider,
          uid: @omniauth.uid,
          email: @omniauth.info.email,
          token: @omniauth.credentials.token,
          password: Devise.friendly_token[0, 20],
          avatar: nil,
          profit: 0,
          point: 0
        )
        redirect_to new_user_registration_path(id: @user.id)
      else
        sign_in(:user, @user)
        redirect_to root_path
      end
    end
  end
end
