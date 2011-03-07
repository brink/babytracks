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
  
end
