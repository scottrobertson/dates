class DatesController < ApplicationController
  def index
    params[:order] = params[:order].presence || 'date'
    params[:sort_mode] = params[:sort_mode].presence || 'asc'

    @date = DateToRemember.new
    @dates = DateToRemember.order(params[:order] => params[:sort_mode])

    # Calendar Stuff
    @earliest_date = [@dates.pluck(:date).min, Date.today].min
    @latest_date = [@dates.pluck(:date).max, Date.today].min

    @dates = @dates.where('date >= ? AND date <= ?', params[:start_date], params[:end_date]) if params[:start_date].present?
    @start_date = [@dates.pluck(:date).min, (params[:start_date] ? Date.parse(params[:start_date]) : nil)].compact.min
    @end_date = [@dates.pluck(:date).max, (params[:end_date] ? Date.parse(params[:end_date]) : nil)].compact.max

    # Travel Stats
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
