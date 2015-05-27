class CloverController < ApplicationController
  def callback
    render json: request
  end
end
