class CloverController < ApplicationController
  def callback
    render json: current_user
  end

  def authorize
    redirect_to current_user.get_clover_auth
  end
end
