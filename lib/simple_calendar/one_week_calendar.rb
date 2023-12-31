module SimpleCalendar
  class OneWeekCalendar < SimpleCalendar::Calendar
    def week_number
      format = (Date.beginning_of_week == :sunday) ? "%U" : "%V"
      start_date.beginning_of_week.strftime(format).to_i
    end

    def date_range
      starting = start_date.beginning_of_week
      ending = starting.end_of_week

      (starting..ending).to_a
    end

    def url_for_previous_view
      view_context.url_for(@params.merge(start_date_param => (date_range.first - 1.day).iso8601))
    end
  end
end
