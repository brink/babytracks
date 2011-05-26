class Event < ActiveRecord::Base
  validates_presence_of :event_type, :message => "You must select an event to save"
  validates_presence_of :user

  belongs_to :user
  
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

  scope :today, lambda {
    begin_today = DateTime.now.beginning_of_day
    end_today = DateTime.now.end_of_day

    where("events.created_at >= ? AND events.created_at <= ?", begin_today, end_today)
  }
  
end
