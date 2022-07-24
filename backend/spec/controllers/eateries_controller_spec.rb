# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/sign_in'

RSpec.describe EateriesController, type: :request do
  describe 'GET /eateries' do
    subject(:request) { get eateries_path }

    include_context 'sign_in'

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
end
