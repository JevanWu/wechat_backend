class Reply < ActiveRecord::Base
  has_many :keywords
  belongs_to :asset

  attr_accessor :keyword
end
