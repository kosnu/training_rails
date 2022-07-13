# frozen_string_literal: true

class User::RegistrationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
    # NOTE: 空のインスタンスが欲しくて `nil` で初期化しました
    # TODO: 多分もっといい方法がある
    @user_form = UserForm.new(name: nil, email: nil)
  end

  # POST /resource/confirmation
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def create
    # TODO: Formオブジェクトに処理を移す？
    if already_registered?(params[:user_form][:email].to_s)
      flash[:error] = 'Given email address is already registered.'
      return render :new
    end

    @user_form = UserForm.new(email: params[:user_form][:email].to_s, name: params[:user_form][:name].to_s)
    if @user_form.save
      super do
        flash[:notice] = 'Sending an email confirmation instruction'
        return render :create
      end
    else
      respond_with(@user_form)
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super do
      return render :show
    end
  end

  # POST /registration/finish
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def finish
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    ActiveRecord::Base.transaction do
      @user = resource.user
      @user_email_authentication =
        registered_password(
          @user,
          params[:password].to_s,
          params[:password_confirmation].to_s
        )
      resource.destroy!
    end

    sign_in(:user, @user)
    sign_in(:database_authentication, @user_email_authentication)

    # TODO: 別のページへ遷移させる
    redirect_to root_path
  rescue StandardError
    render :show
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  # @param [String] email
  def already_registered?(email)
    User::EmailAuthentication.exists?(email:)
  end

  # @param [User] user
  # @param [String] password
  # @param [String] password_confirmation
  def registered_password(user, password, password_confirmation)
    user.email_authentication.password = password
    user.email_authentication.password_confirmation = password_confirmation

    user.email_authentication.save!
    user.email_authentication
  end
end
