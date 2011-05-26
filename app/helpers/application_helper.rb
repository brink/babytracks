module ApplicationHelper
  def pretty_date(date, options = {})
    unless date.nil?
      if options[:time] == true
        date.strftime("%b %d, %Y %I:%M %p")
      else
        date.strftime("%b %d, %Y")
      end
    end
  end
end
