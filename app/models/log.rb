class Log < ActiveRecord::Base
  belongs_to :user
  attr_accessor :session_id
end
