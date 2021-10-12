require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'should have many attendances' do
    employee = Employee.reflect_on_association(:attendances)
    
    expect(employee.macro).to eq(:has_many)
  end
end
