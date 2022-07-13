# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::RegistrationsController, type: :request do
  describe 'GET /registrations/confirmation/new' do
    subject(:request) { get new_registration_confirmation_path }

    context '正常時' do
      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'POST /registrations/confirmation' do
    subject(:request) { post registration_confirmation_path params: }

    let(:params) { {} }

    context '正常時' do
      let(:params) do
        {
          user_form: {
            name: params_user_name,
            email: params_user_email
          }
        }
      end

      let(:params_user_name) { 'test san' }
      let(:params_user_email) { 'test@example.com' }

      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end

      it 'ユーザーが登録されていること' do
        request
        user = User.find_by(name: params_user_name)
        expect(user).to be_present
      end

      it '仮登録したユーザーのメールアドレス宛にメールが送信されていること' do
        request
        mail = ActionMailer::Base.deliveries.last
        expect(mail.to.first).to eq params_user_email
      end
    end
  end

  describe 'GET /registrations/confirmation' do
    subject(:request) { get registration_confirmation_path, params: }

    context '正常時' do
      let(:user) { create :user, :confirming }

      let(:params) do
        {
          confirmation_token: params_confirmation_token
        }
      end
      let(:params_confirmation_token) { user.registration.confirmation_token }

      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'POST /registration/finish' do
    subject(:request) { post finish_user_registration_path, params: }

    let(:params) { {} }

    context '正常時' do
      let(:user) { create :user, :confirming }

      let(:params) do
        {
          confirmation_token: user.registration.confirmation_token,
          password: 'test0123',
          password_confirmation: 'test0123'
        }
      end

      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end

      it '暗号化したパスワードが設定されていること' do
        request
        user.reload
        expect(user.email_authentication.encrypted_password).to be_present
      end

      it '登録確認レコードが削除されていること' do
        request
        user.reload
        expect(user.registration).to be_nil
      end
    end
  end
end
