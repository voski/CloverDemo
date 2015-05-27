class CloverController < ApplicationController
  def callback
    render json: current_user.parse_clover_code(params[:code], params[:merchant_id]).response.body
  end

  def authorize
    redirect_to current_user.get_clover_auth
  end
end
