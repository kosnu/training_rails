# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, skip: :all
  # NOTE: 登録
  devise_for :registrations, class_name: 'User::Registration', controllers: {
    confirmations: 'user/registrations'
  }
  # NOTE: 登録完了
  devise_scope :registration do
    post '/registration/finish', to: 'user/registrations#finish', as: 'finish_user_registration'
  end

  # TODO: ログインルーティング
  # TODO: ログアウトルーティング
  devise_for :users
end
