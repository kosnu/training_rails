# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/sign_in'

RSpec.describe EateriesController, type: :request do
  include_context 'sign_in'

  describe 'GET /eateries' do
    subject(:request) { get eateries_path }

    context '正常時' do
      before do
        create :eatery, name: 'Test Eatery', users: [sign_in_user]
      end

      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end

      it '飲食店の一覧がレスポンスに含まれていること' do
        request
        expect(response.body).to include 'Test Eatery'
      end
    end
  end

  describe 'GET /eatery/new' do
    subject(:request) { get new_eatery_path }

    context '正常時' do
      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'POST /eateries' do
    subject(:request) { post eateries_path(request_params) }

    let(:request_params) do
      {
        eatery: {}
      }
    end

    context '正常時' do
      let(:request_params) do
        {
          eatery: {
            name: eatery_name,
            address: eatery_address
          }
        }
      end

      let(:eatery_name) { 'ABC' }
      let(:eatery_address) { 'Osaka' }

      it 'アクセスできること' do
        request
        expect(response).to have_http_status :ok
      end

      it '飲食店を追加できること' do
        request
        expect(Eatery.find_by(name: eatery_name, address: eatery_address)).to be_present
      end

      it 'ログインユーザーと紐づいていること' do
        request
        eatery = Eatery.find_by(name: eatery_name, address: eatery_address)
        expect(eatery.users).to include sign_in_user
      end
    end
  end
end
