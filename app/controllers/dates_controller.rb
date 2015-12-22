class DatesController < ApplicationController
  def index

    params[:order] = params[:order].presence || 'date'
    params[:sort_mode] = params[:sort_mode].presence || 'asc'

    @dates = DateToRemember.order(params[:order] => params[:sort_mode])
    @date = DateToRemember.new
  end

  def create
    DateToRemember.create! params.require(:date_to_remember).permit(:date, :title)
    redirect_to :back
  end
end
