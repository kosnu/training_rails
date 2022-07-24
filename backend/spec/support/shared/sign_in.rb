# frozen_string_literal: true

RSpec.shared_context 'sign_in', shared_context: :metadata do
  before do
    sign_in(sign_in_user)
  end

  let(:sign_in_user) { create :user, :confirmed }
end
