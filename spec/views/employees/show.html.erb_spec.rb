require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      email: "Email",
      name: "Name",
      position: "Position",
      private_number: "Private Number",
      active: false,
      admin: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/Private Number/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
