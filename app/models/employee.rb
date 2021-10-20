class Employee < ApplicationRecord
  belongs_to :admin
  belongs_to :store
  has_many   :attendances, dependent: :destroy
  validates  :private_number, presence: true, uniqueness: true
  validates  :email,
             :name,
             :position,
             :store_id,
             presence: true
end
