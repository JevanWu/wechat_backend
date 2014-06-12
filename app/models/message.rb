class Message < ActiveRecord::Base
  validates :keyword, uniqueness: true
  scope :all_except_event_messages, -> { where.not(keyword: ["subscribe", "unsubscribe", "default"]) }
end
