class Device < ActiveRecord::Base
  belongs_to :terminal
  belongs_to :device_type
end
