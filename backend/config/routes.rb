# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, skip: :all
  devise_for :registrations, class_name: 'User::Registration', controllers: {
    confirmations: 'user/registrations'
  }
  # TODO: 登録完了ルーティング
  # TODO: ログインルーティング
  # TODO: ログアウトルーティング
  devise_for :users
end
