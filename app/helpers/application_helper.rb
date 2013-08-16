module ApplicationHelper
  include Messages

  def date_formatted(date)
    p date
    date.strftime("%m-%d-%Y")
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
