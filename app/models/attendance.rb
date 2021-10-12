class Attendance < ApplicationRecord
  belongs_to :employee
  attr_accessor :private_number
end
