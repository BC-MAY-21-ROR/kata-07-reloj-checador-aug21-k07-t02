class Employee < ApplicationRecord
  belongs_to :admin
  belongs_to :store
  has_many   :attendances, dependent: :destroy
  # validates  :private_number_id, uniqueness: true
end
