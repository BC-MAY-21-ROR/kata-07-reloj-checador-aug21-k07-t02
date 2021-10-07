class Admin < ApplicationRecord
  has_many :employees, dependent: :destroy
end
