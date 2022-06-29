# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserForm do
  describe '#save' do
    subject(:save) { form.save }

    let(:form) { described_class.new(**attributes) }
    let(:attributes) do
      {
        name: attributes_name,
        email: attributes_email
      }
    end

    let(:attributes_name) { 'taro' }
    let(:attributes_email) { 'taro@example.com' }

    context '正常時' do
      it 'ユーザーを作成できること' do
        expect(save).to be true
        user = User.find(form.id)
        expect(user.name).to eq 'taro'
        expect(user.email).to eq 'taro@example.com'
      end

      it '登録確認トークンが作成されていること' do
        expect(save).to be true
        user = User.find(form.id)
        expect(user.registration.confirmation_token).not_to be_nil
      end
    end

    context 'メールアドレスを指定しなかった時' do
      let(:attributes_email) { '' }

      it 'ユーザーを作成できないこと' do
        expect(save).to be false
        expect(form.errors.first.type).to eq 'Email can\'t be blank'
      end
    end
  end
end
