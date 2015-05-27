class CloverController < ApplicationController
  def callback
    render text: current_user.parse_clover_code(params[:code]).access_token
  end

  def authorize
    redirect_to current_user.get_clover_auth
  end
end
