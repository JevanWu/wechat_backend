class TextMessage < Message
  validates :content, presence: true
end
