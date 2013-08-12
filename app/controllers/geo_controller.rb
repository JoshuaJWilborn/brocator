class GeoController < ApplicationController
  def search
    render :json => get_geo(params[:address])
  end
end
