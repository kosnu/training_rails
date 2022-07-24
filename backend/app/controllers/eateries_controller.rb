# frozen_string_literal: true

class EateriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @eateries = current_user.eateries
  end
end
