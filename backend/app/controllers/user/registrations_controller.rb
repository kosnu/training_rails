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

  def finish
    # TODO: 登録完了処理
  end

  private

  # @param [String] email
  def already_registered?(email)
    User::EmailAuthentication.exists?(email:)
  end
end
