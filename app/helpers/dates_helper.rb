module DatesHelper

  def component_date(date, end_date: nil)
    start_date = date.date
    end_date = end_date || date.end_date.presence
    return nil if end_date.nil?

    component = TimeDifference.between(start_date, end_date).in_general
    output = []
    if component[:years] > 0
      output << pluralize(component[:years], 'year')
    end

    if component[:months] > 0
      output << pluralize(component[:months], 'month')
    end

    if component[:weeks]> 0
      output << pluralize(component[:weeks], 'week')
    end

    if component[:days]> 0
      output << pluralize(component[:days], 'day')
    end

    output.join(', ')
  end
end
