class Message < ActiveRecord::Base
  validates :label, uniqueness: true, inclusion: { in: %w(subscribe unsubscribe default)}
end
