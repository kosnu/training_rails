# frozen_string_literal: true

class EateriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @eateries = current_user.eateries
  end

  def new
    @eatery = Eatery.new
  end

  def create
    # TODO: とりあえず保存できるように書いたロジック。あとで修正したい。
    @eatery = Eatery.new(name: params[:eatery][:name], address: params[:eatery][:address])
    @eatery_user = EateryUser.new(eatery: @eatery, user: current_user)

    if @eatery_user.save
      flash[:notice] = '追加しました'
      render :create
    else
      render :new
    end
  end
end
