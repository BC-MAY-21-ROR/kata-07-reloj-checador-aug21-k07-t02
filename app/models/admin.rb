class Admin < ApplicationRecord
  has_many :employees

  def self.current_admin
    @admin = Admin.first
  end
end
