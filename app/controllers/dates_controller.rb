class DatesController < ApplicationController
  def index
    params[:order] = params[:order].presence || 'date'
    params[:sort_mode] = params[:sort_mode].presence || 'asc'

    @dates = DateToRemember.order(params[:order] => params[:sort_mode])
    @date = DateToRemember.new
  end

  def create
    @date = DateToRemember.create(date_params)
    redirect_to dates_path
  end

  def edit
    @date = DateToRemember.find params[:id]
  end

  def update
    @date = DateToRemember.find params[:id]
    @date.update(date_params)
    redirect_to dates_path
  end

  private

  def date_params
    params.require(:date_to_remember).permit(:date, :title, :end_date, :category)
  end
end
