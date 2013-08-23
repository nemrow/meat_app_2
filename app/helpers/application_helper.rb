require 'date'

module ApplicationHelper
  include Messages

  def date_formatted(date)
    date.strftime("%m-%d-%Y")
  end

  def day_of_week(date)
    date.strftime('%A')
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def days_of_week_options_array
    [
      ['Monday', 'Monday'],
      ['Tuesday', 'Tuesday'],
      ['Wednesday', 'Wednesday'],
      ['Thursday', 'Thursday'],
      ['Friday', 'Friday'],
      ['Saturday', 'Saturday'],
      ['Sunday', 'Sunday']
    ]
  end

  def days_of_week_single
    %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  end

  def week_day_to_num(day)
    days_of_week_single.index(day)
  end

  def num_to_week_day(num)
    num = num % 7
    days_of_week_single[num]
  end

  def date_from_formatted_string(date)
    Date.strptime(date,"%m-%d-%Y").to_time
  end
end
