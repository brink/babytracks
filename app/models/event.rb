class Event < ActiveRecord::Base
  validates_presence_of :event_type, :message => "You must select an event to save"
  belongs_to :user
  validates_presence_of :user

  
  scope :by_user, lambda {|user| 
    where("events.user_id = ?", user.id)
  }
  scope :feedings, lambda {
    where("events.event_type = ?", 'feeding')
  }

  scope :diapers, lambda {
    where("events.event_type = ?", 'diaper')
  }

  scope :arranged_by_day, lambda{
    group("DATE(events.created_at)")
  }

  scope :by_date, lambda {|date|
    begin_day = DateTime.parse(date).beginning_of_day
    end_day = DateTime.parse(date).end_of_day

    where("events.created_at >= ? AND events.created_at <= ?", begin_day, end_day)
  }
  scope :by_days_ago, lambda {|num|
    num = num.to_i
    begin_day = DateTime.now.beginning_of_day - num.days
    end_day = DateTime.now.end_of_day - num.days

    where("events.created_at >= ? AND events.created_at <= ?", begin_day, end_day)
  }
  scope :today, lambda {
    begin_today = DateTime.now.beginning_of_day
    end_today = DateTime.now.end_of_day

    where("events.created_at >= ? AND events.created_at <= ?", begin_today, end_today)
  }
  
end
