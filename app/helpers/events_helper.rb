module EventsHelper
  def google_api_graph(target_date)
    before_today = (Date.today - Date.parse(target_date.to_s)).to_i

    feedings = Event.by_user(current_user).feedings.arranged_by_day.size
    diapers = Event.by_user(current_user).diapers.arranged_by_day.size 

      max_d = diapers.max[1] rescue 0
      max_f = feedings.max[1] rescue 0

    if max_d > max_f
      max = max_d
    else
      max = max_f
    end

    start_date = Date.today - (6 + before_today).days
    end_date = Date.today + ( -before_today).days
    date_range = (start_date..end_date).to_a

    date_range = date_range.to_a
    if feedings
      feeding_vals = date_range.collect{|d| feedings[d.to_s].to_i}
    else
      feeding_vals = []
    end

    if diapers
      diaper_vals = date_range.collect{|d| diapers[d.to_s].to_i}
    else
      diapers_vals = []
    end

    # from http://imagecharteditor.appspot.com/
    url = %W(http://chart.apis.google.com/chart
       ?chxl=0:#{date_range.inject(""){|res,e| res + "|" + e.strftime('%a')}}
       &chs=640x220
       &chxr=1,0,#{max}
       &chxt=x,y
       &chds=0,0,0,#{max},0,0,0,#{max}
       &cht=lxy
       &chg=0,10,0,0
       &chco=3072F3,FF0000
       &chd=t:-1|#{feeding_vals.join(',')}|-1|#{diaper_vals.join(',')}
       &chdl=Feedings|Diapers
       &chdlp=b
       &chls=2|2
       &chma=5,5,5,25).to_s
  end
end
