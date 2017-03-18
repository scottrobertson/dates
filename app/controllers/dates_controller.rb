class DatesController < ApplicationController
  def index
    params[:order] = params[:order].presence || 'date'
    params[:sort_mode] = params[:sort_mode].presence || 'asc'

    @dates = DateToRemember.order(params[:order] => params[:sort_mode])
    @date = DateToRemember.new

    @travel_dates = @dates.where(category: 'Travel').where('end_date IS NOT null AND end_date < ?', Date.today).to_a
    @travel_count = @travel_dates.pluck(:title).uniq.size
    @travel_start = @travel_dates.pluck(:date).min
    @travel_days = @travel_dates.sum{|d| (d.end_date - d.date).to_i}
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
