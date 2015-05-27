class CloverController < ApplicationController
  def callback
    render json: params
  end

  def authorize
    redirect_to current_user.get_clover_auth
  end
end
