class Terminal < ActiveRecord::Base
  belongs_to :company
  has_many :devices
end
