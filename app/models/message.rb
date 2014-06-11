class Message < ActiveRecord::Base
  validates :label, uniqueness: true, inclusion: { in: %w(subscribed unsubscribed default)}
end
