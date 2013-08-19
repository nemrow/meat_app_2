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
      ['Friday', 'Firday'],
      ['Saturday', 'Saturday'],
      ['Sunday', 'Sunday']
    ]
  end
end
