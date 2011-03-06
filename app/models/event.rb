class Event < ActiveRecord::Base
  validates_presence_of :event_type, :message => "You must select an event to save"
  validates_presence_of :user

  belongs_to :user


end
