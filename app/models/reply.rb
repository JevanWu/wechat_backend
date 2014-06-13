class Reply < ActiveRecord::Base
  has_many :keywords

  attr_accessor :keyword
end
